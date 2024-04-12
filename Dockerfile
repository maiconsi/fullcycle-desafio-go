FROM golang:latest AS builder-stage

WORKDIR /app

COPY . .

RUN go build main.go

FROM scratch as release-stage

WORKDIR /app

COPY --from=builder-stage /app /app

CMD [ "./main" ]