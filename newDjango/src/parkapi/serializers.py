from rest_framework import serializers
from .models import Park


class ParkSerializer(serializers.ModelSerializer):
    distance = serializers.DecimalField(
        source='distance.mi', max_digits=10, decimal_places=2, required=False, read_only=True)

    class Meta:
        model = Park
        fields = ('id', 'park_name', 'park_facility',
                  'park_equipment', 'park_score', 'location', 'distance')
        read_only_fields = ('distance',)
