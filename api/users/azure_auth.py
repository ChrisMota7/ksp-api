import requests
from django.conf import settings

def get_azure_token(auth_code):
    url = f"https://login.microsoftonline.com/{settings.AZURE_AD_TENANT_ID}/oauth2/v2.0/token"

    data = {
        'client_id': settings.AZURE_AD_CLIENT_ID,
        'scope': 'openid profile email offline_access',  # Cambiado a scopes válidos para usuario
        'code': auth_code,
        'redirect_uri': settings.AZURE_AD_REDIRECT_URI,
        'grant_type': 'authorization_code',
        'client_secret': settings.AZURE_AD_CLIENT_SECRET,
    }

    response = requests.post(url, data=data)
    print("AZURE TOKEN RESPONSE:", response.text)

    if response.status_code != 200:
        print("❌ Error obteniendo el token.")
        return None

    return response.json()


def get_user_profile(access_token):
    headers = {'Authorization': f'Bearer {access_token}'}
    url = 'https://graph.microsoft.com/v1.0/me?$select=displayName,mail,userPrincipalName'

    response = requests.get(url, headers=headers)
    print("USER PROFILE RESPONSE:", response.text)

    if response.status_code != 200:
        print("❌ Error obteniendo perfil del usuario.")
        return None

    user_data = response.json()
    print("✅ USER DATA:", user_data)

    return user_data  # <- Regresa todo el JSON, no solo el email

