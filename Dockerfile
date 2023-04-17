FROM golang:1.20 as builder
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN CGO_ENABLED=0 GOOS=linux go build -o ostrich ./cmd/mainApp

FROM alpine:latest AS production
RUN apk --no-cache add tzdata 
COPY --from=builder /app .
ENV TZ="Asia/Almaty"
CMD ["./ostrich", "config-path", "configs/docker.toml"]