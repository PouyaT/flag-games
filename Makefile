PWD = $(CURDIR)
IMAGE_NAME = flag-game
CONTAINER_NAME = flag-game
VERSION=$(shell git rev-parse --short HEAD)
KUBE_DEPLOYMENT_NAME = flag-game-deployment
DOCKER_USERNAME=pouyatav
FULL_IMAGE_NAME = $(DOCKER_USERNAME)/$(IMAGE_NAME):$(VERSION)
# create requirements.txt
requirements:
	pip freeze > "$(PWD)\requirements.txt"

# build a docker image and remove all unused image
docker-build:
	docker build --tag $(FULL_IMAGE_NAME) .
	docker image prune --filter="dangling=true" --force

# run a docker container
docker-run:
	 docker run -d -p 8000:8000 --name $(CONTAINER_NAME) $(FULL_IMAGE_NAME)

# destroy the docker container
docker-destroy:
	docker rm $(CONTAINER_NAME) -f

# push docker image to private repo
docker-push:
	docker push $(FULL_IMAGE_NAME)
# delete all docker images that start with `IMAGE_NAME` regardless of the tag
docker-delete-all-images:
	docker rmi $(shell docker images -q $(IMAGE_NAME):*)

# build a docker image, start up a (local) kubernetes cluster and deploy the imagee from the deployment.yaml file
minikube-deploy:
	make docker-build
	minikube start
	minikube image load $(IMAGE_NAME)
	kubectl apply -f "$(PWD)\manifests\namespace.yaml"
	kubectl apply -f "$(PWD)\manifests\service.yaml"
	kubectl apply -f "$(PWD)\manifests\deployment.yaml"

