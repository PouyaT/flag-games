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

# Run locally
1. Make sure the files `flag_games/flag_games/.env` and `flag_games/flag_games/local_settings.py` exists
   1. These files should exist in the same dir as `settings.py`
2. Run the command `make minikube-deploy`
3. Then run`kubectl port-forward services/flag-game-deployment -n django 8080:8000`
4. Go to this url `127.0.0.1:8080`