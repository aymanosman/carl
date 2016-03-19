gce-push: release
	gsutil cp rel/carl/releases/0.0.1/carl.tar.gz gs://aosman/carl.tar.gz

release: build
	MIX_ENV=prod mix release

build: deps
	MIX_ENV=prod mix compile

deps:
	mix deps.get

image:
	docker build -t carl:v1 .
