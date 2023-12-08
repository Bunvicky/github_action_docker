FROM golang:1.17-buster AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /my_demo

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /my_demo /my_demo

USER nonroot:nonroot

ENTRYPOINT ["/my_demo"]