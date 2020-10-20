FROM golang:1.15-alpine as builder

WORKDIR /src

RUN apk add --no-cache make

COPY go.mod go.mod
COPY go.sum go.sum
RUN go mod download

COPY . /src

RUN make build

FROM alpine:latest as runnner

COPY --from=builder /src/bin/hello /usr/local/bin

ENTRYPOINT /usr/local/bin/hello
