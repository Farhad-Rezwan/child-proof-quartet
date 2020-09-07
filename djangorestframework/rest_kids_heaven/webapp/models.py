from django.db import models


class park(models.Model):
    parkname=models.CharField(max_length=10)
    parkfacility=models.CharField(max_length=10)
    parkid=models.IntegerField()

    def __str__(self):
        return self.parkname


