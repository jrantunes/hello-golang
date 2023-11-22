FROM golang:latest as builder

WORKDIR /app

COPY . .

RUN go mod init main

RUN go build .

FROM scratch

COPY --from=builder /app/main .

CMD ["./main"]