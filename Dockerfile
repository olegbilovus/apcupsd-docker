FROM alpine:latest

RUN apk update && apk add --no-cache apcupsd

ADD apcupsd.conf /etc/apcupsd/apcupsd.conf

EXPOSE 3551

CMD [ "/sbin/apcupsd", "-b" ]
