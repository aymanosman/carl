gce-push: release
  tar -cz rel > rel.tar.gz
  gsutil cp rel.tar.gz gs://aosman/carl.tar.gz

release: build
	MIX_ENV=prod mix release

build: deps
	mix deps.compile

deps:
	mix deps.get
