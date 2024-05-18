from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.exceptions import AuthenticationFailed
from rest_framework.permissions import AllowAny
from .serializers import UserSerializer
from .models import User
import jwt, datetime
from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from django.core.exceptions import MultipleObjectsReturned
from rest_framework import status
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework import generics
from rest_framework_simplejwt.exceptions import InvalidToken, TokenError
from rest_framework_simplejwt.views import TokenObtainPairView
from users.serializers import CustomTokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from .models import User
from .serializers import UserSerializer

# Create your views here.
class UserListView(generics.ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = [IsAuthenticated]

class RegisterView(APIView):
    def post(self, request):
        serializer = UserSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)
    
class LogoutView(APIView):
    permission_classes = [IsAuthenticated,]

    def post(self, request):
        try:
            refresh_token = request.data.get("refresh_token")
            token = RefreshToken(refresh_token)
            token.blacklist()  # Añadir el token a la lista negra

            return Response({"message": "Logout successful."}, status=status.HTTP_205_RESET_CONTENT)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)
            
class UserTypeView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        user = request.user
        is_admin = user.isAdmin == '1'
        return Response({'is_admin': is_admin})
    
class CustomTokenObtainPairView(TokenObtainPairView):
     serializer_class = CustomTokenObtainPairSerializer

class UpdateUserView(APIView):

    def put(self, request, user_id):
        try:
            user = User.objects.get(pk=user_id)
            data = request.data
            serializer = UserSerializer(user, data=data, partial=True) 
            if serializer.is_valid():
                serializer.save()
                return Response({'status': 'success', 'message': 'Actualizado exitosamente.', 'User': serializer.data})
            else:
                return Response({'message' : 'Error al actualizar', 'User' : serializer.data})

        except User.DoesNotExist:
            return Response({'error': 'User not found.'}, status=status.HTTP_404_NOT_FOUND)
        
class DeleteUserView(APIView):
    def put(self, request, user_id):
        try:
            user = User.objects.get(pk=user_id)
            user.isDeleted = '1'
            user.save()
            return Response({'status': 'success', 'message': 'User marked as deleted.'}, status=status.HTTP_204_NO_CONTENT)
        except User.DoesNotExist:
            return Response({'error': 'User not found.'}, status=status.HTTP_404_NOT_FOUND)
    
   