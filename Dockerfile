FROM golang:1.12.5
RUN apt-get update && apt-get install unzip
RUN go get google.golang.org/genproto/googleapis/grafeas/v1 google.golang.org/grpc google.golang.org/grpc/credentials
COPY ./go/main.go /go/main.go
WORKDIR /go
RUN go build -o grafeas-cli .
COPY ca.crt client.key client.crt ./
ENTRYPOINT ["./grafeas-cli"]

#FROM alpine:latest
#WORKDIR /
#COPY --from=0 /go/grafeas-cli /grafeas-cli
#COPY ca.crt client.key client.crt /
#ENTRYPOINT ["./grafeas-cli"]
