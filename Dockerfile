FROM alpine

WORKDIR /app

RUN apk add jq curl bind-tools

COPY . .

RUN /usr/bin/crontab crontab.txt

RUN chmod 755 cf.sh

CMD ["/usr/sbin/crond", "-f", "-l", "8"]
