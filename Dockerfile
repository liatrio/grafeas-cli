FROM golang:1.12.5
RUN apt-get update && apt-get install unzip
WORKDIR /go/src/github.com/grafeas
RUN git clone https://github.com/grafeas/grafeas
WORKDIR /go/src/github.com/grafeas/grafeas
RUN make build
COPY ./go /go
WORKDIR /go/src
RUN go install grafeascli

FROM alpine:latest
WORKDIR /
COPY --from=0 /go/bin/grafeascli /grafeascli
COPY ca.crt client.key client.crt /
ENTRYPOINT ["/grafeascli"]
