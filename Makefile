all: build

build: clean
	hugo

clean:
	rm -rfv public/*

server:
	hugo server || true

image:
	docker build -t mbentley/www.mbentley.net:latest .

run:
	docker run -it --rm -p 80:80 mbentley/www.mbentley.net:latest

.PHONY: all build clean image run server
