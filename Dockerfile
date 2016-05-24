FROM ubuntu:trusty
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
COPY entrypoint.sh /entrypoint.sh
RUN sed -i '1ideb mirror://mirrors.ubuntu.com/mirrors.txt trusty main universe multiverse' /etc/apt/sources.list && \
	sed -i '1ideb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main universe multiverse' /etc/apt/sources.list && \
	sed -i '1ideb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main universe multiverse' /etc/apt/sources.list && \
	sed -i '1ideb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main universe multiverse' /etc/apt/sources.list && \
	apt-get update && apt-get -y dist-upgrade && \
	apt-get -y install git libmysqlclient-dev libsmi2ldbl libxslt1-dev python python-dev snmp-mibs-downloader && \
	useradd -d /home/conpot -s /bin/bash -m -U conpot && \
	cd /opt && \
	git clone https://github.com/mushorg/conpot.git && \
	cd conpot && \
	python setup.py install && \
	mkdir /opt/conpot/log && \
	chown -R conpot:conpot /opt/conpot && \
	chmod +x /entrypoint.sh

EXPOSE 80 102 161/udp 502 623/udp 47808/udp
ENTRYPOINT ["/entrypoint.sh"]
