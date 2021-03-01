from django.db import models


VEHICLE_TYPE = (
    ('2 Wheelers', '2 Wheelers'),
    ('4 Wheelers', '4 Wheelers')
)

PAY_MODE = (
    ('Cash', 'Cash'),
    ('Card', 'Card')
)

CITIES = (
    ('Gurgaon', 'Gurgaon'),
    ('Delhi', 'Delhi'),
    ('Noida', 'Noida')
)


class CommonInfo(models.Model):
    added_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True


# Parking Companies
class ParkingCompany(CommonInfo):
    name = models.CharField(max_length=100, blank=False)
    location = models.CharField(max_length=50, choices=CITIES, default='Gurgaon')
    
    def __str__(self):
        return self.name+" | "+self.location

    class Meta:
        unique_together = ['name', 'location']

class VehicleSlotPrice(CommonInfo):
    parking_company = models.ForeignKey(ParkingCompany, on_delete=models.CASCADE)
    vehicle_type = models.CharField(max_length=15, choices=VEHICLE_TYPE, default='2 Wheelers')
    max_slot = models.IntegerField(default=1)
    hour = models.IntegerField(default=2)
    hour_price = models.DecimalField(max_digits=5, decimal_places=2)
    additional_charge_per_hour = models.IntegerField(default=10) # % of hour_price
    
    class Meta:
        unique_together = ['parking_company', 'vehicle_type']

class VehicleParkingData(CommonInfo):
    parking_company = models.ForeignKey(ParkingCompany, on_delete=models.CASCADE)
    vehicle_type = models.CharField(max_length=15, choices=VEHICLE_TYPE, default='2 Wheelers')
    vehicle_number = models.CharField(max_length=20)
    in_time = models.DateTimeField(null=True)
    out_time = models.DateTimeField(null=True)
    total_park_hour = models.IntegerField(default=0)
    total_park_min = models.IntegerField(default=0)
    parking_amount = models.DecimalField(max_digits=6, decimal_places=2, null=True)
    payment_mode = models.CharField(max_length=15, choices=PAY_MODE, default='Cash')
