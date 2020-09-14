from django.db import models


class park(models.Model):
    parkname=models.CharField(max_length=100)
    parkfacility=models.CharField(max_length=30)
    parkid=models.IntegerField()
    parkFacility = ArrayField(
            models.CharField(max_length=30, blank=True),
            size=8,
        ),
    )

    def __str__(self):
        return self.parkname


