# What I need before running
I am running python 3.10, but I'm sure any somewhat recent Python 3.x version will work

# How to get started
run in flag-games dir `pip install -r requirements.txt` 

CD into `flag-games/flag_games` dir then run `python manage.py runserver` to run the game locally

# Example of game
http://ptavakoli.pythonanywhere.com/


# Run locally in kuberentes cluster
# Pre-Reqs 
- minikube
- docker
- kubectl

# Run locally
1. Make the files `flag_games/flag_games/.env` and `flag_games/flag_games/local_settings.py` exists
   1. These files should exist in the same dir as `settings.py`
2. Run the command `make minikube-deploy`
3. Then run`kubectl port-forward services/flag-game-deployment -n django 8080:8000`
4. Go to this url `127.0.0.1:8080`