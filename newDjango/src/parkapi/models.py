from django.db import models
from django_earthdistance.models import EarthDistanceQuerySet
from django_earthdistance.models import EarthDistance, LlToEarth
from django.contrib.postgres.fields import ArrayField
from django.contrib.gis.db import models

# Create your models here.

class Park(models.Model):
    park_name = models.CharField(max_length=100)
    location = models.PointField(null=True, blank=True)
    park_facility = ArrayField(models.CharField(max_length=30, blank=True),size=20, null=True)
    park_equipment = ArrayField(models.CharField(max_length=30, blank=True),size=20, null=True)
    park_score = models.DecimalField(max_digits=4, decimal_places=2)

def __str__(self):
    return self.park_name