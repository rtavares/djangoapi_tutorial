import os
from dotenv import load_dotenv

from .base import *   # noqa: F403  # Exceptional situation. 'Import star' should be avoided

load_dotenv()

DATABASE_NAME = os.environ.get('DATABASE_NAME')  # noqa: F405
DATABASE_USER = os.environ.get('DATABASE_USER')  # noqa: F405
DATABASE_PASS = os.environ.get('DATABASE_PASS')  # noqa: F405
DATABASE_HOST = os.environ.get('DATABASE_HOST')  # noqa: F405
DATABASE_PORT = os.environ.get('DATABASE_PORT')  # noqa: F405

# Database
# https://docs.djangoproject.com/en/2.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': DATABASE_NAME,
        'USER': DATABASE_USER,
        'PASSWORD': DATABASE_PASS,
        'HOST': DATABASE_HOST,
        'PORT': DATABASE_PORT,
    }
}
