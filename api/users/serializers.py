from rest_framework import serializers
from rest_framework_simplejwt.tokens import RefreshToken, TokenError
from .models import User
from django.contrib.auth import authenticate
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
        
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'firstName', 'lastName', 'email', 'password', 'isDeleted', 'isAdmin', 'createdAt']
        extra_kwargs = {
            'password': {
                'write_only': True
            }
        }
    
    def create(self, validated_data):
        password = validated_data.pop('password', None)
        instance = self.Meta.model(**validated_data)
        if password is not None:
            instance.set_password(password)
        instance.save()
        return instance
    
    def update(self, instance, validated_data):
        password = validated_data.pop('password', None)
        for attr, value in validated_data.items():
            setattr(instance, attr, value)
        if password:
            instance.set_password(password)
        instance.save()
        return instance
    
class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):
    username_field = User.EMAIL_FIELD if hasattr(User, 'EMAIL_FIELD') else 'email'

    def validate(self, attrs):
        email = attrs.get(self.username_field)
        password = attrs.get('password')

        if not email:
            raise serializers.ValidationError({'message': 'No se ingreso el email.'})
        if not password:
            raise serializers.ValidationError({'message': 'No se ingreso el password.'})

        # Autenticar al usuario
        user = authenticate(username=email, password=password)
        if not user:
            # Revisa si el problema es el correo o la contraseña
            user_exists = User.objects.filter(email=email).exists()
            if user_exists:
                raise serializers.ValidationError({'message': 'Contraseña incorrecta'})
            else:
                raise serializers.ValidationError({'message': 'Correo incorrecto'})

        # Verificar si el usuario puede autenticarse, si no está activo, etc.
        if not user.is_active:
            raise serializers.ValidationError({'message': 'Este usuario no puede iniciar sesión.'})

        # Autenticación correcta, retorna los tokens
        data = super().validate(attrs)
        return data