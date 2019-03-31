FROM golang:1.12-alpine

WORKDIR /go/src/zxq.co/Sunpy/avatar-server-go
COPY . .

RUN go get -d -v ./...
RUN CGO_ENABLED=0 go install -v ./...

FROM alpine
WORKDIR /avatar_server/
COPY --from=0 /go/bin/avatar-server-go ./

EXPOSE 5000

CMD ["./avatar-server-go"]
