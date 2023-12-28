FROM python:3.11-alpine3.19
# setup env variables
ENV PYTHONBUFFERED=1
ENV DockerHOME=/app/django-app
# create work dir
RUN mkdir -p $DockerHOME
# set work dir
WORKDIR $DockerHOME
# copy code to work dir
COPY . $DockerHOME
# install curl for healthcheck
RUN apk --no-cache add curl
# install dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
# move working dir to where manage.py is
WORKDIR $DockerHOME/flag_games
# Expose port
EXPOSE 8000
# Add healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost:8000/health/ || exit 1
# run commands for app to run
RUN python manage.py collectstatic --noinput
CMD ["gunicorn", "--bind",  "0.0.0.0:8000", "flag_games.wsgi"]

# useful reference https://github.com/spirkaa/gia-api/blob/main/.docker/django/k8s.Dockerfile
# another useful reference https://github.com/dotja/django-docker-compose/blob/main/Dockerfile