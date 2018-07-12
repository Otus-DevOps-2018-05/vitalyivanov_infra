#!/bin/bash
gcloud compute instances create reddit-app-base \
	--boot-disk-size=10GB \
	--image-family reddit-base \
	--machine-type=g1-small \
	--tags puma-server \
	--restart-on-failure