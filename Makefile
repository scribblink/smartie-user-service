build: 
	protoc -I. --go_out=plugins=micro:. \
		proto/auth/auth.proto
	GOOS=linux GOARCH=amd64 go build -o smartie-user-service && \
	docker build -t smartie-user-service .

run:
	docker run --net="host" \
		-p 50051 \
		-e DB_HOST=localhost \
		-e DB_PASS=password \
		-e DB_USER=postgres \
		-e MICRO_SERVER_ADDRESS=:50051 \
		-e MICRO_REGISTRY=mdns \
		smartie-user-service