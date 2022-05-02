# --- Build the backend kubeflow-wheel ---
FROM klstg-docker.slb-wartifactory-v.stg.rmn.local/rakuten/rflow/rflow-python:3.7.13 AS backend-kubeflow-wheel

WORKDIR /src

COPY ./common/backend/ .
RUN python3 setup.py bdist_wheel

# --- Build the frontend kubeflow library ---
#FROM klstg-docker.slb-wartifactory-v.stg.rmn.local/rakuten/rflow/rflow-node:12.10.0-build-1 as frontend-kubeflow-lib
FROM node:12.22.12 as frontend-kubeflow-lib


# Yulong start
# To upgrade version
RUN apt-get update && apt-get install -y curl
RUN curl --silent --location https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y \
  nodejs
RUN echo "Node: " && node -v
RUN echo "NPM: " && npm -v
# Yulong end

WORKDIR /src

ENV NG_CLI_ANALYTICS "ci"
COPY ./common/frontend/kubeflow-common-lib/package.json ./
COPY ./common/frontend/kubeflow-common-lib/package-lock.json ./

RUN npm ci

COPY ./common/frontend/kubeflow-common-lib/projects ./projects
COPY ./common/frontend/kubeflow-common-lib/angular.json .
COPY ./common/frontend/kubeflow-common-lib/tsconfig.json .
RUN npm run build

# --- Build the frontend ---
#FROM klstg-docker.slb-wartifactory-v.stg.rmn.local/rakuten/rflow/rflow-node:12.10.0-build-1 as frontend
FROM node:12.22.12 as frontend

# Yulong start
# To upgrade version
RUN apt-get update && apt-get install -y curl
RUN curl --silent --location https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y \
  nodejs
RUN echo "Node: " && node -v
RUN echo "NPM: " && npm -v
# Yulong end

WORKDIR /src

COPY ./jupyter/frontend/package.json ./
COPY ./jupyter/frontend/package-lock.json ./
COPY ./jupyter/frontend/tsconfig.json ./
COPY ./jupyter/frontend/tsconfig.app.json ./
COPY ./jupyter/frontend/tsconfig.spec.json ./
COPY ./jupyter/frontend/angular.json ./
COPY ./jupyter/frontend/src ./src

ENV NG_CLI_ANALYTICS "ci"
RUN npm ci
COPY --from=frontend-kubeflow-lib /src/dist/kubeflow/ ./node_modules/kubeflow/

RUN npm run build -- --output-path=./dist/default --configuration=production
RUN npm run build -- --output-path=./dist/rok --configuration=rok-prod

# Web App
FROM klstg-docker.slb-wartifactory-v.stg.rmn.local/rakuten/rflow/rflow-python:3.7.13

WORKDIR /package
COPY --from=backend-kubeflow-wheel /src .
RUN pip3 install .

WORKDIR /src
COPY ./jupyter/backend/requirements.txt .
RUN pip3 install -r requirements.txt

COPY ./jupyter/backend/apps/ ./apps
COPY ./jupyter/backend/entrypoint.py .

COPY --from=frontend /src/dist/default/ /src/apps/default/static/
COPY --from=frontend /src/dist/rok/ /src/apps/rok/static/

ENTRYPOINT ["/bin/bash","-c","gunicorn -w 3 --bind [::]:5000 --access-logfile - entrypoint:app"]
