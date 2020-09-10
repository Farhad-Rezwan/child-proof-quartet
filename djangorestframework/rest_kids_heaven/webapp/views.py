from django.shortcuts import render

from django.http import HttpResponse
from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from . models import park
from .serializers import parkSerializers

# Create your views here.


class parkList(APIView):

    def get(self, request):
        park1 = park.objects.all()
        serializers = parkSerializers(park1, many=True)
        return Response(serializers.data)

    def post(self):
        pass


