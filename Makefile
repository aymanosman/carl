IMAGE=carl:v1.0.3
GCR_PREFIX=gcr.io/aosman-alpha

google-storage-push: clean release
	gsutil cp rel/carl/releases/0.0.1/carl.tar.gz gs://aosman/carl.tar.gz

gcr-push: image
	docker tag carl ${GCR_PREFIX}/${IMAGE}
	gcloud docker push ${GCR_PREFIX}/${IMAGE}

clean:
	rm -rf rel/carl

release: build
	PORT=80 MIX_ENV=prod mix release

build: deps
	MIX_ENV=prod mix compile

deps:
	mix deps.get

image:
	docker build -t carl:latest .

run: image
	docker run \
		-p 8080:80 \
		-p 1234-1236:1234-1236/tcp \
		--name carl \
		carl:v1

test-entrypoint:
	docker run -it --rm -e MY_POD_IP=10.99.99.99 carl bash
