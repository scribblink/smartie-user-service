build: 
	protoc -I. --go_out=plugins=micro:. \
		proto/user/user.proto
	GOOS=linux GOARCH=amd64 go build -o smartie-user-service && \
	docker build -t smartie-user-service .

run:
	docker run -p 50051:50051 -e MICRO_SERVER_ADDRESS=:50051 smartie-user-service