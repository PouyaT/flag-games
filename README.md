# What I need before running
I am running python 3.10, but I'm sure any somewhat recent Python 3.x version will work

# How to get started
1. In `flag-games` dir run the command: `pip install -r requirements.txt`
2. In `flag-games/flag-games` dir run `python manage.py collectstatic --noinput`
3. In `flag-games/flag_games` dir run `python manage.py runserver` 

# Example of game
http://ptavakoli.pythonanywhere.com/


# Run locally in kuberentes cluster
# Pre-Reqs 
- minikube
- docker
- kubectl

# Run locally in a docker container
1. Make sure the files `flag_games/.env`
2. Have Docker Desktop open 
3. Run `make docker-build`
4. Then run`make docker-run`
5. Go to this url `127.0.0.1:8080`