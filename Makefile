gce-push: clean release
	gsutil cp rel/carl/releases/0.0.1/carl.tar.gz gs://aosman/carl.tar.gz

clean:
	rm -rf rel

release: build
	PORT=80 MIX_ENV=prod mix release

build: deps
	MIX_ENV=prod mix compile

deps:
	mix deps.get

image: build
	docker build -t carl:v1 .

run: image
	docker run \
		-p 8080:80 \
		-p 1234-1236:1234-1236/tcp \
		--name carl \
		carl:v1
