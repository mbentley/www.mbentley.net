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

publish: build
	rsync --progress --delete-after -avh --no-owner --no-group --exclude='.git/' public/ root@athena:/mnt/www/www.mbentley.net/
	ssh root@athena /root/scripts/set_www_permissions

.PHONY: all build clean image run server
