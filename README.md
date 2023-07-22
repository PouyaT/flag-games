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
1. Run the command `make minikube-deploy`
2. Then run`kubectl port-forward services/flag-game-deployment -n django 8080:8000`
3. Go to this url `127.0.0.1:8080`