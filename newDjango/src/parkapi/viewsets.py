from rest_framework import viewsets
from . import models
from . import serializers


class ParkViewSet(viewsets.ModelViewSet):
    queryset = models.Park.objects.all()
    serializer_class = serializers.ParkSerializer
