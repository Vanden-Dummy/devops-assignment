FROM golang:1.19 AS builder
WORKDIR /app
COPY . /app
RUN go mod download
RUN go build

FROM golang:alpine
WORKDIR /app
COPY --from=builder /app /app
ENTRYPOINT ["go","run","backend"]