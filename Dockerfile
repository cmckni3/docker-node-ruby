FROM buildpack-deps:jessie
MAINTAINER Chris McKnight <cmckni3@gmail.com>

ENV NODE_MAJOR_VERSION 10
ENV YARN_VERSION 1.7.0
ENV RUBY_MAJOR 2.5
ENV RUBY_VERSION 2.5.1
ENV RUBY_BUILD_DIR /tmp/ruby-build
ENV RUBYGEMS_VERSION 2.6.13
ENV BUNDLER_VERSION 1.15.4

# skip installing gem documentation
RUN mkdir -p /usr/local/etc \
  && { \
    echo 'install: --no-document'; \
    echo 'update: --no-document'; \
  } >> /usr/local/etc/gemrc

RUN apt-get update && \
    apt-get install -y apt-transport-https bash rbenv && \
    git clone https://github.com/rbenv/ruby-build.git "${RUBY_BUILD_DIR}" && \
    PREFIX=/usr/local "${RUBY_BUILD_DIR}/install.sh" && \
    curl -o- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends yarn && \
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash && \
    rm -rf /var/lib/apt/lists/*

# Install nodejs, yarn, and ruby default versions
RUN . ~/.bashrc && \
    nvm install "${NODE_MAJOR_VERSION}" && \
    nvm alias default "${NODE_MAJOR_VERSION}" && \
    rbenv install "${RUBY_VERSION}" && \
    rbenv global "${RUBY_VERSION}" && \
    gem install bundler --version "${BUNDLER_VERSION}"
