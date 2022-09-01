from django.shortcuts import render

# se crean las vistas (programación).

def home(request):
    return render(request, 'app/home.html')
