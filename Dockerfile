FROM ruby:2.6.3@sha256:358f16e92d0f66599103318f7a8528d449b0973fd89e46a1a5c47cec7479f09b

MAINTAINER hoonti06 <hoonti06@gmail.com>

ENV LANG C.UTF-8
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN gem install bundler:2.1.2

# install pandoc
ARG DEBIAN_FRONTEND=noninteractive

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && apt-get -qq install zip && \
	curl -o pandoc.deb -fsSL https://github.com/jgm/pandoc/releases/download/2.7.3/pandoc-2.7.3-1-amd64.deb && \
	dpkg -i pandoc.deb && \
	rm -f pandoc.deb



# install node	
ARG REFRESHED_AT
ENV REFRESHED_AT $REFRESHED_AT

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get install -qq --no-install-recommends \
	nodejs \
	yarn

RUN npm install yamljs


# install ditaa
RUN apt-get install -y --no-install-recommends -qq \
	ditaa
	
# install plantuml	
RUN apt-get install -y --no-install-recommends -qq \
	graphviz

RUN curl -o plantuml.jar -fsSL http://sourceforge.net/projects/plantuml/files/plantuml.jar/download && \
	mv plantuml.jar /usr/local/src/ && \
	echo '#!/bin/bash' > /usr/bin/plantuml && \
	echo "java -jar /usr/local/src/plantuml.jar \"\$1\" \"\$2\"" >> /usr/bin/plantuml && \
	chmod +x /usr/bin/plantuml



RUN	apt-get -qq clean && rm -rf /var/lib/apt/list/* /tmp/* /var/tmp/*
