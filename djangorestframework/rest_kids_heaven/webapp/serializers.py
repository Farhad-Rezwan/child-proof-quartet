from rest_framework import serializers
from . models import park


class parkSerializers(serializers.ModelSerializer):

    class Meta:
        model = park
        fields = '__all__'
