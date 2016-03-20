gce-push: clean release
	gsutil cp rel/carl/releases/0.0.1/carl.tar.gz gs://aosman/carl.tar.gz

clean:
	rm -rf rel

release: build
	MIX_ENV=prod mix release --port 80

build: deps
	MIX_ENV=prod mix compile

deps:
	mix deps.get

image:
	docker build -t carl:v1 .
