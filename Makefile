CATALOG_DIR ?= deepshore-catalog
CATALOG_FILE ?= catalog.yaml
TEMPLATE_FILE ?= catalog-template.yaml
DOCKER_REGISTRY ?= quay.io
DOCKER_REPO ?= maltegroth/deepshore-catalog
DOCKER_IMAGE ?= ${DOCKER_REGISTRY}/${DOCKER_REPO}:latest


.PHONY: create-dockerfile
create-dockerfile:
	opm generate dockerfile ${CATALOG_DIR}

.PHONY: generate-catalog
generate-catalog:
	opm alpha render-template semver -o yaml < ${TEMPLATE_FILE} > ${CATALOG_DIR}/${CATALOG_FILE}

.PHONY: validate-catalog
validate-catalog:
	(opm validate ${CATALOG_DIR}) || (echo "Validation failed"; exit 1)

.PHONY: docker-build
docker-build:
	docker build . -f ${CATALOG_DIR}.Dockerfile -t ${DOCKER_IMAGE}

.PHONY: docker-push
docker-push:
	docker push ${DOCKER_IMAGE}
