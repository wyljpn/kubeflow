GIT_TAG ?= v1.3.0
IMG ?= klstg-docker.slb-wartifactory-v.stg.rmn.local/rakuten/rflow/rflow-jupyter-web-app
DOCKERFILE ?= jupyter/Dockerfile

docker-build:
	cd ../ && docker build -t ${IMG}:${GIT_TAG} -f ${DOCKERFILE} .

docker-push:
	docker push $(IMG):$(GIT_TAG)

image: docker-build docker-push
