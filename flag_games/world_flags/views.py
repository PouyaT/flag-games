import random
from django.shortcuts import render
import pycountry
import json


def index(request):
    return render(request, 'flag_games/index.html')


def randomize(request):
    num_choices = 4
    country_codes = []
    country_names = []
    country_list = list(pycountry.countries)
    cnt = 0
    country_set = set()
    while cnt != 4:
        random_num = random.randint(0, len(pycountry.countries))
        country = country_list[random_num - 1]
        if country.name not in country_set:
            country_codes.append(str.lower(country.alpha_2))
            country_names.append(country.name)
            country_set.add(country.name)
            cnt += 1

    target_country_indx = random.randint(0, num_choices - 1)
    target_country_code = country_codes[target_country_indx]
    target_country_name = country_names[target_country_indx]

    ctx = {
        'country_codes': country_codes,
        'country_names': country_names,
        'target_country_code': target_country_code,
        'target_country_name': target_country_name
    }
    json_ctx = json.dumps(ctx)
    ctx['json_ctx'] = json_ctx

    return render(request, 'world_flags/randomize.html', ctx)
