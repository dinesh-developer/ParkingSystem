from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import AllowAny
from app1.models import VehicleParkingData, VehicleSlotPrice, ParkingCompany
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
        company_id = request.data.get('lot_unique_id', '')
        if v_number and v_type and company_id:
            if VehicleParkingData.objects.filter(out_time=None, vehicle_type=v_type, vehicle_number=v_number).exists():
                response = {'data':json_data, 'message':'This vehicle is already parked in.'}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
            company_obj = ParkingCompany.objects.filter(id=company_id)
            if company_obj.exists():
                company_obj = company_obj[0]
                vehicle_slot_price_obj = VehicleSlotPrice.objects.filter(parking_company=company_obj, vehicle_type=v_type)
                if vehicle_slot_price_obj.exists():
                    total_slot = vehicle_slot_price_obj[0].max_slot
                    occupied_slot = VehicleParkingData.objects.filter(parking_company=company_obj, out_time=None, vehicle_type=v_type).count()
                    if occupied_slot < total_slot:
                        parking_obj = VehicleParkingData.objects.create(parking_company=company_obj, vehicle_type=v_type, vehicle_number=v_number, in_time=datetime.now())
                        status_code = status.HTTP_201_CREATED
                        message = 'Parked Successfully'
                        json_data['parking_number'] = parking_obj.id
                    else:
                        message = 'Slot is not available'
                        status_code = status.HTTP_200_OK
                else:
                    message = "Slots not avilable for "+v_type
                    status_code = status.HTTP_406_NOT_ACCEPTABLE   
            else:
                message = "lot_unique_id is invalid"
                status_code = status.HTTP_400_BAD_REQUEST    
        else:
            message = "vehicle_type, vehicle_number and lot_unique_id all are required"
            status_code = status.HTTP_400_BAD_REQUEST
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
            status_code = status.HTTP_200_OK
            vehicle_obj = VehicleParkingData.objects.filter(id=parking_id)
            if vehicle_obj.exists():
                vehicle_obj = vehicle_obj.filter(out_time=None)
                if vehicle_obj.exists():
                    vehicle_obj = vehicle_obj[0]
                    slot_price_obj = VehicleSlotPrice.objects.get(parking_company=vehicle_obj.parking_company, vehicle_type=vehicle_obj.vehicle_type)
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
                else:
                    message = 'This vehicle is already park out.'
            else:
                message = 'Not found this parking number vehicle'
        else:
            message = 'Parking number & Payment method both are required'
            status_code = status.HTTP_400_BAD_REQUEST
        response = {'data':json_data, 'message':message}
        return Response(response, status=status_code)


# Showing current availability for all vehicle types.
class SlotsAvailability(APIView):
    permission_classes = [AllowAny]

    def get(self, request):
        json_data = []
        companies = ParkingCompany.objects.all()
        vehicle_parking_objs = VehicleParkingData.objects.filter(out_time=None)
        for company in companies:
            res = {'name' : company.name, 'location':company.location, 'parking_lot_unique_id':company.id}
            company_wise_slosts = VehicleSlotPrice.objects.filter(parking_company=company)
            for obj in company_wise_slosts:
                occupied_count = vehicle_parking_objs.filter(parking_company=company, vehicle_type=obj.vehicle_type).count()
                res[obj.vehicle_type] = obj.max_slot - occupied_count
            if '2 Wheelers' in res.keys() or '4 Wheelers' in res.keys():
                json_data.append(res)
        #     slot_objs = VehicleSlotPrice.objects.values('vehicle_type').annotate(Sum('max_slot'))
        # vehicle_parking_objs = VehicleParkingData.objects.filter(out_time=None)
        # for obj in slot_objs:
        #     occupied_count = vehicle_parking_objs.filter(vehicle_type=obj['vehicle_type']).count()
        #     json_data[obj['vehicle_type']] = obj['max_slot__sum'] - occupied_count
        response = {'data':json_data, 'message':"Success"}
        return Response(response, status=status.HTTP_200_OK)


# All parking activity for a particular vehicle. Accepting parking number as param
class VehicleActivity(APIView):
    permission_classes = [AllowAny]
    
    def post(self, request):
        # parking_id = request.data.get('parking_number', '')
        v_number = request.data.get('vehicle_number', '')
        json_data = {}
        if v_number:
            status_code = status.HTTP_200_OK
            try:
                activity_obj = VehicleParkingData.objects.get(vehicle_number=v_number)
                json_data = VehicleParkingDataSerializer(activity_obj).data
                message = "Success"
            except:
                message = 'Not Found this Vehicle Number'
        else:
            message = 'Vehicle Number is required'
            status_code = status.HTTP_400_BAD_REQUEST
        response = {'data': json_data, 'message':message}
        return Response(response, status=status_code)
