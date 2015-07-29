FROM buildpack-deps:jessie

ENV NODE_VERSION 0.10
ENV RUBY_VERSION 2.1.6

RUN apt-get update
# Install nodejs
RUN curl --silent --location https://deb.nodesource.com/setup_${NODE_VERSION} | bash - \
    && apt-get install --yes nodejs
# Install ruby
RUN apt-get install --yes ruby-build \
    && curl --silent -O https://raw.githubusercontent.com/sstephenson/ruby-build/master/share/ruby-build/${RUBY_VERSION} \
    && ruby-build $RUBY_VERSION /usr/bin \
    && rm $RUBY_VERSION \
    && apt-get --auto-remove --purge --yes remove ruby-build \
    && rm -rf /tmp/*.log \
    && rm -rf /var/lib/apt/lists/*
