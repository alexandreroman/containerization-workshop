# Copyright 2022 VMware. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

REQUIRED_BINARIES := vendir

check-carvel:
	$(foreach exec,$(REQUIRED_BINARIES),\
		$(if $(shell which $(exec)),,$(error "'$(exec)' not found. Carvel toolset is required. See instructions at https://carvel.dev/#install")))

sync: check-carvel
	vendir sync

build: sync
	$(MAKE) -C build/01-basics             build && \
	$(MAKE) -C build/02-official-images    build && \
	$(MAKE) -C build/03-run-as-non-root    build && \
	$(MAKE) -C build/04-multi-stage-builds build && \
	$(MAKE) -C build/05-exploded           build && \
	$(MAKE) -C build/06-buildpacks         build

deploy: check-carvel
	kubectl apply -k deploy
