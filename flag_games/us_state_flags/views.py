import random
from django.template import loader
from django.shortcuts import render
from django.http import HttpResponse
import pycountry


def index(request):
    return render(request, 'us_state_flags/index.html')


def randomize(request):
    state_abrs = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA",
                  "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
                  "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
                  "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
                  "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    random_num = random.randint(0, 49)
    state_abr = state_abrs[random_num]
    state_code = f"US-{state_abr}"
    state_name = pycountry.subdivisions.get(code=state_code)
    ctx = {
        'state_code': str.lower(state_name.code),
        'state_name': state_name.name
    }

    return render(request, 'us_state_flags/randomize.html', ctx)
