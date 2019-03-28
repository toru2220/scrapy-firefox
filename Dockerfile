FROM	python:3.6-stretch

ENV     DEBIAN_FRONTEND noninteractive


RUN	apt-get update && \
        apt-get install -y --no-install-recommends unzip wget curl tar unzip fontconfig xvfb libgconf2-4 imagemagick && \
	echo "deb http://http.debian.net/debian unstable main" | tee /etc/apt/sources.list.d/firefox.list && \
	apt-get update && \
	apt-get -y install --no-install-recommends -t unstable firefox firefox-l10n-ja

RUN     apt-get update && \
        apt-get install -y --no-install-recommends python3-dev python3-pip python-twisted libxml2-dev python-lxml python-requests nodejs && \
        rm -rf /var/lib/apt/lists/*
RUN     pip3 install pymongo urllib3 requests scrapy mpegdash m3u8 fake-useragent twython mojimoji pillow slackweb lxml && \
	pip3 install git+https://github.com/yashaka/selene.git

WORKDIR /usr/bin
RUN	wget https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz && \
	tar zxvf geckodriver-v0.24.0-linux64.tar.gz && \
	rm geckodriver-v0.24.0-linux64.tar.gz

WORKDIR /data
VOLUME  /data

COPY	IPAfont00303.zip /data/IPAfont00303.zip

RUN	unzip IPAfont00303.zip -d /usr/share/fonts/ && \
	fc-cache -fv







