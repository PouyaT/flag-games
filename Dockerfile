FROM python:3.11
# setup env variables
ENV PYTHONBUFFERED=1
ENV DockerHOME=/app/django-app
# create work dir
RUN mkdir -p $DockerHOME
# set work dir
WORKDIR $DockerHOME
# copy code to work dir
COPY . $DockerHOME
# install dependencies
RUN pip install -r requirements.txt

WORKDIR $DockerHOME/flag_games

