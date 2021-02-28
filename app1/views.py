from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import AllowAny
from app1.models import VehicleParkingData, VehicleSlotPrice
from app1.serializers import VehicleParkingDataSerializer
from datetime import datetime
from django.db.models import Sum, Count
import math


# Allow vehicles to park.
class VehicleIn(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        json_data = {}
        message = ''
        v_type = request.data.get('vehicle_type', '')
        v_number = request.data.get('vehicle_number', '')
        if v_number and v_type:
            total_slot = VehicleSlotPrice.objects.get(vehicle_type=v_type).max_slot
            occupied_slot = VehicleParkingData.objects.filter(out_time=None, vehicle_type=v_type).count()
            if occupied_slot < total_slot:
                parking_obj = VehicleParkingData.objects.create(vehicle_type=v_type, vehicle_number=v_number, in_time=datetime.now())
                status_code = status.HTTP_201_CREATED
                message = 'Parked Successfully'
                json_data['parking_number'] = parking_obj.id
            else:
                message = 'Slot is not available'
                status_code = status.HTTP_200_OK
        else:
            message = "vehicle_type and vehicle_number both are required"
            status_code = status.HTTP_200_OK
        response = {'data':json_data, 'message':message}
        return Response(response, status=status_code)

# Allow vehicles to get out from parking.
class VehicleOut(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        json_data = {}
        parking_id = request.data.get('parking_number', '')
        payment_method = request.data.get('payment_method', '')
        if parking_id and payment_method:
            try:
                vehicle_obj = VehicleParkingData.objects.get(id=parking_id, out_time=None)
                slot_price_obj = VehicleSlotPrice.objects.get(vehicle_type=vehicle_obj.vehicle_type)
                in_time = vehicle_obj.in_time.replace(tzinfo=None)
                out_time = datetime.now()
                hours = math.ceil((out_time - in_time).seconds/3600)
                if hours > slot_price_obj.hour:
                    parking_amount = (slot_price_obj.hour_price)+(hours-slot_price_obj.hour)*(slot_price_obj.additional_charge_per_hour)/100
                else:
                    parking_amount = slot_price_obj.hour_price
                vehicle_obj.parking_amount = parking_amount
                vehicle_obj.total_park_hour = math.ceil((out_time-in_time).seconds/60)//60
                vehicle_obj.total_park_min = math.ceil((out_time-in_time).seconds/60)%60
                vehicle_obj.out_time = out_time
                vehicle_obj.payment_mode = payment_method
                vehicle_obj.save()
                json_data['paid_amount'] = parking_amount
                message = 'Success' 
            except:
                message = 'Not found this parking number vehicle'
        else:
            message = 'Parking number & Payment method both are required'
        response = {'data':json_data, 'message':message}
        return Response(response, status=status.HTTP_200_OK)


# Showing current availability for all vehicle types.
class SlotsAvailability(APIView):
    permission_classes = [AllowAny]

    def get(self, request):
        json_data = {}
        slot_objs = VehicleSlotPrice.objects.values('vehicle_type').annotate(Sum('max_slot'))
        vehicle_parking_objs = VehicleParkingData.objects.filter(out_time=None)
        for obj in slot_objs:
            occupied_count = vehicle_parking_objs.filter(vehicle_type=obj['vehicle_type']).count()
            json_data[obj['vehicle_type']] = obj['max_slot__sum'] - occupied_count
        response = {'data':json_data, 'message':"Success"}
        return Response(response, status=status.HTTP_200_OK)


# All parking activity for a particular vehicle. Accepting parking number as param
class VehicleActivity(APIView):
    permission_classes = [AllowAny]
    
    def post(self, request):
        parking_id = request.data.get('parking_number', '')
        json_data = {}
        if parking_id:
            try:
                activity_obj = VehicleParkingData.objects.get(id=parking_id)
                json_data = VehicleParkingDataSerializer(activity_obj).data
                message = "Success"
            except:
                message = 'Not Found this Parking Number'
        else:
            message = 'Please provide Parking Number'
        response = {'data': json_data, 'message':message}
        return Response(response, status=status.HTTP_200_OK)
