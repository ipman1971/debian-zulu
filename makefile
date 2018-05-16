IMAGE_NAME=ipman1971/debian-zulu
CONTAINER_NAME=debian-zulu-container

default: build

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) /bin/bash

clean:
	docker rm -f $(CONTAINER_NAME)

clean-image:
	docker rmi -f $(IMAGE_NAME)
