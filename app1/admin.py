from django.contrib import admin
from app1.models import *

@admin.register(VehicleSlotPrice)
class VehicleSlotPriceAdmin(admin.ModelAdmin):
    list_display = ("vehicle_type", "max_slot", "hour", "hour_price")


@admin.register(VehicleParkingData)
class VehicleParkingDataAdmin(admin.ModelAdmin):
    list_display = ("vehicle_type", "vehicle_number", "in_time", "out_time", "parking_amount", "payment_mode")