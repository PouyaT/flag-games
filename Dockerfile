FROM python:3.11
# setup env variables
ENV PYTHONBUFFERED=1
ENV DockerHOME=/app/django-app
# Expose port
EXPOSE 8000
# create work dir
RUN mkdir -p $DockerHOME
# set work dir
WORKDIR $DockerHOME
# copy code to work dir
COPY . $DockerHOME
# install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt
# move working dir to where manage.py is
WORKDIR $DockerHOME/flag_games
# run commands for app to run
RUN python manage.py collectstatic --noinput
CMD ["gunicorn", "--bind",  "0.0.0.0:8000", "flag_games.wsgi"]
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]