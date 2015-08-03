FROM buildpack-deps:jessie
MAINTAINER Chris McKnight <cmckni3@gmail.com>

ENV NODE_VERSION 0.10
ENV RUBY_VERSION 2.1.6
ENV RUBY_BUILD_TMPDIR /tmp/ruby-build
ENV RUBY_BUILD_DIR /usr/src/ruby-build

RUN apt-get update
# Install nodejs
RUN curl --silent --location https://deb.nodesource.com/setup_${NODE_VERSION} | bash - \
    && apt-get install --yes nodejs
# Install ruby
RUN git clone --quiet https://github.com/sstephenson/ruby-build.git $RUBY_BUILD_DIR \
    && ${RUBY_BUILD_DIR}/install.sh \
    && TMPDIR=$RUBY_BUILD_TMPDIR ruby-build $RUBY_VERSION /usr \
    && rm -rf $RUBY_BUILD_DIR \
    && rm -rf /tmp/*.log \
    && rm -rf $RUBY_BUILD_TMPDIR

RUN gem install bundler

ADD gemrc /usr/etc/gemrc
