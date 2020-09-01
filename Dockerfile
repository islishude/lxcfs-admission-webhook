FROM golang:alpine as BUILDER
WORKDIR /workdir
COPY . .
RUN go build -o /app/lxcfs-admission-webhook .

FROM alpine:latest
COPY --from=BUILDER /app/lxcfs-admission-webhook /lxcfs-admission-webhook
ENTRYPOINT ["./lxcfs-admission-webhook"]
