""" Create an Admin superuser in DEV environment """
from django.conf import settings
from django.contrib.auth.models import User


def run():
    success_color = '\033[92m'
    error_color = '\033[91m'
    std_color = '\x1b[0m'

    if settings.DEBUG:
        admin_name = 'admin'
        admin_email = 'admin@example.com'
        admin_passwd = 'superuser'

        have_admin = User.objects.filter(username=admin_name)

        if have_admin:
            print(f"{success_color}Admin user already exist: '{admin_name}'.")
        else:
            result = User.objects.create_superuser(admin_name, admin_email, admin_passwd)
            if isinstance(result, User):
                print(f"{success_color}Admin user created with username='{admin_name}' and password='{admin_passwd}'.")
            else:
                raise Exception(f"{error_color}\nError while creating Admin user. Result: {result}.")
    else:
        print(f"{error_color}\n*** ERROR!!! *** \n Command only available on DEV mode.\n")

    print(std_color)
