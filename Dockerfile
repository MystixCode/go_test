FROM golang:1.18

WORKDIR /app

COPY *.go ./

# Download necessary Go modules
#RUN go mod init "go_test_prod"
# if u already have go.mod and go.sum files use following instead:
COPY go.mod ./
#COPY go.sum ./
RUN go mod download

RUN go build -o /go_test_prod

CMD [ "/go_test_prod" ]
