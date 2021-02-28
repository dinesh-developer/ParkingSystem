from django.db import models


VEHICLE_TYPE = (
    ('2 Wheelers', '2 Wheelers'),
    ('4 Wheelers', '4 Wheelers')
)

PAY_MODE = (
    ('Cash', 'Cash'),
    ('Card', 'Card')
)

class CommonInfo(models.Model):
    added_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True


class VehicleSlotPrice(CommonInfo):
    vehicle_type = models.CharField(max_length=15, choices=VEHICLE_TYPE, default='2 Wheelers', unique=True)
    max_slot = models.IntegerField(default=1)
    hour = models.IntegerField(default=2)
    hour_price = models.DecimalField(max_digits=5, decimal_places=2)
    additional_charge_per_hour = models.IntegerField(default=10) # % of hour_price


class VehicleParkingData(CommonInfo):
    vehicle_type = models.CharField(max_length=15, choices=VEHICLE_TYPE, default='2 Wheelers')
    vehicle_number = models.CharField(max_length=20)
    in_time = models.DateTimeField(null=True)
    out_time = models.DateTimeField(null=True)
    total_park_hour = models.IntegerField(default=0)
    total_park_min = models.IntegerField(default=0)
    parking_amount = models.DecimalField(max_digits=6, decimal_places=2, null=True)
    payment_mode = models.CharField(max_length=15, choices=PAY_MODE, default='Cash')
