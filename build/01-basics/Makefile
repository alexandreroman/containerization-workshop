# Copyright 2022 VMware. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

OCI_IMAGE := ghcr.io/alexandreroman/containerization-workshop-app:basics

build:
	docker build -t $(OCI_IMAGE) .

run:
	docker run --rm -p 8080:8080 $(OCI_IMAGE)

push:
	docker push ${OCI_IMAGE}
