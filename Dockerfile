FROM golang:1.12.5
RUN apt-get update && apt-get install unzip
RUN go get google.golang.org/genproto/googleapis/grafeas/v1 google.golang.org/grpc google.golang.org/grpc/credentials
COPY ./go/main.go /go/main.go
WORKDIR /go
RUN CGO_ENABLED=0 go build -o grafeas-cli .

FROM alpine:latest
WORKDIR /
COPY --from=0 /go/grafeas-cli /grafeas-cli
COPY ca.crt ca.key ca.crt /
ENTRYPOINT ["./grafeas-cli"]
