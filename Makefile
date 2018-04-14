all: build

build: clean
	hugo

clean:
	rm -rfv public/*

image: build
	docker build -t mbentley/www.mbentley.net:latest .

run:
	docker run -it --rm -p 80:80 mbentley/www.mbentley.net:latest

server:
	hugo server || true

.PHONY: all build clean image run server
