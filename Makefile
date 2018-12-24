run: build
	docker run -it \
   					 -p 8053:53/udp \
						 -p 8053:53/tcp \
						 --cap-drop=ALL \
						 -v ${PWD}/config:/etc/nsd/ \
						 nsd-testbed

build:
	docker build -t nsd-testbed .
