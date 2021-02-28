from rest_framework import serializers
from app1.models import VehicleParkingData


class VehicleParkingDataSerializer(serializers.ModelSerializer):
    class Meta:
        model = VehicleParkingData
        fields = ['vehicle_type', 'vehicle_number', 'in_time', 'out_time', 'parking_amount']
