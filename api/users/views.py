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

from django.core.mail import send_mail
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_str
from django.contrib.auth import get_user_model


User = get_user_model()

class SendPasswordResetEmail(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        email = request.data['email']
        user = User.objects.filter(email=email).first()
        if user:
            token_generator = PasswordResetTokenGenerator()
            token = token_generator.make_token(user)
            uid = urlsafe_base64_encode(force_bytes(user.pk))
            url = f"http://localhost:3000/resetPassword?uid={uid}&token={token}"
            send_mail(
                'Reestablecer contraseña',
                f'Da click en el siguiente enlace para recuperar tu contraseña: {url}',
                'soporte@ksp.com.mx',
                [email],
                fail_silently=False,
            )
            return Response({"message": "Email sent."}, status=status.HTTP_200_OK)
        return Response({"error": "User not found."}, status=status.HTTP_404_NOT_FOUND)


class ResetPassword(APIView):
    permission_classes = [AllowAny]

    def post(self, request, uidb64, token):
        print(f"Received UIDB64: {uidb64}")
        print(f"Received Token: {token}")
        
        try:
            uid = force_str(urlsafe_base64_decode(uidb64))
            print(f"Decoded UID: {uid}")
            user = User.objects.get(pk=uid)
            print(f"User found: {user.email}")
        except (TypeError, ValueError, User.DoesNotExist) as e:
            print("User not found or invalid UID")
            print(e)
            user = None

        if user is not None and PasswordResetTokenGenerator().check_token(user, token):
            password = request.data.get('password', None)
            print(f"New Password: {password}")
            if password:
                user.set_password(password)
                user.save()
                return Response({"message": "Password reset successfully."})
            else:
                return Response({"error": "Password not provided."}, status=400)
        else:
            print(f"Invalid token or user ID: UID({uidb64}) Token({token})")
            return Response({"error": "Invalid token or user ID."}, status=400)
        
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
    