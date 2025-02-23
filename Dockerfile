FROM cm2network/steamcmd:latest

USER root

LABEL maintainer="scott.t.lusk@gmail.com"

ENV STEAMAPPID 1639880
ENV STEAMAPPDIR /home/steam/longvinter-dedicated-server
ENV STEAMSCRIPTDIR /home/steam/scripts

VOLUME [${STEAMAPPDIR}/data]
EXPOSE 7777/udp 27016

RUN apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests \
		locales \
		lib32gcc-s1 && \
	sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && locale-gen

CMD ${STEAMSCRIPTDIR}/steam_update.sh && \
	${STEAMSCRIPTDIR}/configure_server.sh && \
	cd ${STEAMAPPDIR} && \
	./LongvinterServer.sh

ADD src ${STEAMSCRIPTDIR}

RUN ${STEAMSCRIPTDIR}/steam_update.sh
