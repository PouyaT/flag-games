PWD = $(CURDIR)
IMAGE_NAME = "docker-django"
CONTAINER_NAME = "flag-game"
KUBE_DEPLOYMENT_NAME = "flag-game-deployment"
# create requirements.txt
requirements:
	pip freeze > "$(PWD)\requirements.txt"

# build a docker image and remove all unused image
docker-build:
	docker build --tag $(IMAGE_NAME) .
	docker image prune --filter="dangling=true" --force

# run a docker container
docker-run:
	 docker run -d -p 8000:8000 --name $(CONTAINER_NAME) $(IMAGE_NAME)

# destroy the docker container
docker-destroy:
	docker rm $(CONTAINER_NAME) -f

# build a docker image, start up a (local) kubernetes cluster and deploy the imagee from the deployment.yaml file
minikube-deploy:
	make docker-build
	minikube start
	minikube image load $(IMAGE_NAME)
	kubectl apply -f "$(PWD)\manifests\namespace.yaml"
	kubectl apply -f "$(PWD)\manifests\service.yaml"
	kubectl apply -f "$(PWD)\manifests\deployment.yaml"

