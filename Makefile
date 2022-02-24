docker-build:
	docker build -t api_doc_server:v1 .

docker-run:
	docker run --name=api_doc_server -d --rm -v $(shell pwd):/usr/share/nginx/html -p 8383:80 api_doc_server:v1

docker-build-api:
	docker exec -ti api_doc_server sh -c "cd /usr/share/nginx/html && apidoc -i src -o doc"

docker-start:
	make docker-build && make docker-run && make docker-build-api


docker-stop:
	docker stop api_doc_server