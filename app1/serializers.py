from rest_framework import serializers
from app1.models import VehicleParkingData


class VehicleParkingDataSerializer(serializers.ModelSerializer):
    company_name = serializers.CharField(source='parking_company.name')
    location = serializers.CharField(source='parking_company.location')

    class Meta:
        model = VehicleParkingData
        fields = ['company_name','location','vehicle_type', 'vehicle_number', 'in_time', 'out_time', 'parking_amount']
