joe:
	gcloud compute instances create joe \
		--image ubuntu-14-04 \
		--metadata-from-file startup-script=bootstrap.sh \
		--metadata name=joe \
		--machine-type f1-micro \
		--tags http-server \

mike:
	gcloud compute instances create mike \
		--image ubuntu-14-04 \
		--metadata-from-file startup-script=bootstrap.sh \
		--metadata name=mike \
		--machine-type f1-micro \
		--tags http-server \

rob:
	gcloud compute instances create rob \
		--image ubuntu-14-04 \
		--metadata-from-file startup-script=bootstrap.sh \
		--metadata name=rob \
		--machine-type f1-micro \
		--tags http-server \

vm-1:
	gcloud compute instances create vm-1 \
		--image container-vm \
		--metadata-from-file google-container-manifest=carl-pod.yaml \
		--metadata name=vm-1 \
		--machine-type f1-micro \
		--tags http-server \
