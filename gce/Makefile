joe:
	gcloud compute instances create joe \
		--image ubuntu-14-04 \
		--metadata-from-file startup-script=bootstrap.sh \
		--machine-type f1-micro \
		--tags http-server \

mike:
	gcloud compute instances create mike \
		--image ubuntu-14-04 \
		--metadata-from-file startup-script=bootstrap.sh \
		--machine-type f1-micro \
		--tags http-server \

vm-1:
	gcloud compute instances create vm-1 \
		--image container-vm \
		--metadata-from-file google-container-manifest=carl-pod.yaml \
		--machine-type f1-micro \
		--tags http-server \
