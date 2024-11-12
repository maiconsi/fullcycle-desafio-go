FROM golang:latest AS builder-stage

WORKDIR /app

COPY . .

RUN go build -ldflags="-s -w" main.go

FROM scratch as release-stage

WORKDIR /app

COPY --from=builder-stage /app /app

CMD [ "./main" ]