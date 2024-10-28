all: build

build: clean
	hugo --logLevel info

clean:
	rm -rfv public/*

server:
	hugo server --logLevel info || true

image:
	docker build -t mbentley/www.mbentley.net .

run:
	docker run -it --rm -p 80:80 mbentley/www.mbentley.net

.PHONY: all build clean image run server
