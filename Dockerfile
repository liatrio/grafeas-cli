FROM golang:1.12.5
RUN apt-get update && apt-get install unzip
WORKDIR /go/src/github.com/grafeas
RUN git clone https://github.com/grafeas/grafeas
RUN git clone https://github.com/liatrio/grafeascli
WORKDIR /go/src/github.com/grafeas/grafeas
RUN make build
WORKDIR /go/src/github.com/liatrio/grafeascli/go
RUN GO111MODULE=on CGO_ENABLED=0 go build -o grafeascli .

#FROM alpine:latest
#WORKDIR /
#COPY --from=0 /go/bin/grafeascli /grafeascli
#COPY ca.crt client.key client.crt /
#ENTRYPOINT ["/grafeascli"]
