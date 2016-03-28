FROM ubuntu
RUN apt-get update && apt-get install -y curl wget vim jq unzip psmisc
# Install ngrok (latest official stable from https://ngrok.com/download).
ADD https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip /ngrok.zip
RUN set -x \
 && unzip -o ngrok.zip -d /bin \
 && rm -f /ngrok.zip
ADD https://github.com/kelseyhightower/confd/releases/download/v0.12.0-alpha3/confd-0.12.0-alpha3-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd
ADD goforever /goforever
RUN chmod +x /goforever
ADD gosuv /usr/local/bin/gosuv
RUN chmod +x /usr/local/bin/gosuv
RUN bash -c 'mkdir -p /etc/confd/{conf.d,templates}'
ADD confd.toml /etc/confd/conf.d/confd.toml
ADD ngrok.yml.tmpl /etc/confd/templates/ngrok.yml.tmpl
ADD start.sh /start.sh
ADD goforever.toml /goforever.toml
RUN chmod +x /start.sh
RUN mkdir /etc/ngrok
CMD "/start.sh"



