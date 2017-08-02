FROM ieee0824/go-circleci-docker AS go-build

WORKDIR /go/src/github.com/ieee0824/circleci-docker-multi-stage-build

COPY . .

RUN CGO_ENABLED=0 go build .

FROM alpine:3.6

RUN apk add --no-cache ca-certificates

COPY --from=go-build /go/src/github.com/ieee0824/circleci-docker-multi-stage-build/circleci-docker-multi-stage-build /bin/circleci-docker-multi-stage-build

CMD ["/bin/circleci-docker-multi-stage-build"]
