from parkapi.viewsets import ParkViewSet
from rest_framework import routers

router = routers.DefaultRouter()
router.register('park', ParkViewSet)