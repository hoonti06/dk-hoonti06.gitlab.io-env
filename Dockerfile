FROM ruby:2.6.3@sha256:358f16e92d0f66599103318f7a8528d449b0973fd89e46a1a5c47cec7479f09b

MAINTAINER hoonti06 <hoonti06@gmail.com>

ENV LANG C.UTF-8
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN gem install bundler:2.1.2

# Upgrade OS 
ARG DEBIAN_FRONTEND=noninteractive

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && apt-get -qq install zip



# Install node (for executing generateData.js)
ARG REFRESHED_AT
ENV REFRESHED_AT $REFRESHED_AT

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get install -y -qq --no-install-recommends \
	nodejs \
	yarn

RUN npm install yamljs


# Install ditaa
RUN apt-get install -y -qq --no-install-recommends \
	ditaa
	

RUN	apt-get -qq clean && rm -rf /var/lib/apt/list/* /tmp/* /var/tmp/*
