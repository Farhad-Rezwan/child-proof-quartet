from .models import Park
from . import serializers
from rest_framework import generics
import geocoder
from django.contrib.gis.geos import GEOSGeometry
from django.contrib.gis.db.models.functions import Distance


class ParkViewSet(generics.ListCreateAPIView):
    queryset = Park.objects.all()
    serializer_class = serializers.ParkSerializer


    def perform_create(self, serializer):
        address = serializer.initial_data['location']
        g = geocoder.osm(address)
        if g:
            latitude = g.osm.get('y')
            longitude = g.osm.get('x')
            if latitude and longitude:
                pnt = 'POINT(' + str(longitude) + ' ' + str(latitude) + ')'
                serializer.save(location=pnt)
        serializer.save(location=address)
        

    def get_queryset(self):
        qs = super().get_queryset()
        longitude = self.request.query_params.get('lon', None)
        latitude = self.request.query_params.get('lat', None)

        if latitude and longitude:
            pnt = GEOSGeometry('POINT(' + str(longitude) + ' ' + str(latitude) + ')', srid=4326)
            qs = qs.annotate(distance=Distance('location', pnt)).order_by('distance')

        return qs
    
