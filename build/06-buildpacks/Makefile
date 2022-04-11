# Copyright 2022 VMware. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

OCI_IMAGE := ghcr.io/alexandreroman/containerization-workshop-app:buildpacks

# Please note we don't use any Dockerfile in this section.
# We rely on Cloud-native Buildpacks to build container images,
# using the pack CLI (https://buildpacks.io/docs/tools/pack/)
# and the Paketo Buildpacks implementation (https://paketo.io/).
build:
	pack build $(OCI_IMAGE) -B paketobuildpacks/builder:base -p app -e "BP_JVM_VERSION=17.*"

run:
	docker run --rm -p 8080:8080 $(OCI_IMAGE)

push:
	docker push ${OCI_IMAGE}
