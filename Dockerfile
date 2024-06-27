FROM alpine:latest

RUN apk update && apk add --no-cache apcupsd curl

ADD apcupsd.conf /etc/apcupsd/apcupsd.conf

ENV GOTIFY_HOST=http://gotify
ENV GOTIFY_TOKEN=null
ADD onbattery_gotify /etc/apcupsd/onbattery
ADD offbattery_gotify /etc/apcupsd/offbattery
ADD changeme_gotify /etc/apcupsd/changeme
ADD commfailure_gotify /etc/apcupsd/commfailure
ADD commok_gotify /etc/apcupsd/commok

EXPOSE 3551

CMD [ "/sbin/apcupsd", "-b" ]
