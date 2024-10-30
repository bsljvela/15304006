from rest_framework import serializers
from .models import Product


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        # fields=('id', 'fullname', 'nickname', 'age', 'is_active')
        fields = '__all__'
