import logging

from django.shortcuts import render
from django.http import JsonResponse


def index(request):
    logging.info("In root index views")
    return render(request, 'flag_games/index.html')


def health_check(request):
    logging.info("In root health check views")
    # Perform any checks to determine the health of your application
    is_healthy = True

    # Return a JSON response with the health status
    if is_healthy:
        return JsonResponse({'status': 'ok'}, status=200)
    else:
        return JsonResponse({'status': 'error'}, status=503)
