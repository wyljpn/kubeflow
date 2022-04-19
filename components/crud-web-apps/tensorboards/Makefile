GIT_TAG ?= v1.3.1
IMG ?= klstg-docker.slb-wartifactory-v.stg.rmn.local/rakuten/rflow/rflow-tensorboards-web-app
DOCKERFILE=tensorboards/Dockerfile

docker-build:
	cd ../ && docker build -t ${IMG}:${GIT_TAG} -f ${DOCKERFILE} .

docker-push:
	docker push $(IMG):$(GIT_TAG)

image: docker-build docker-push
