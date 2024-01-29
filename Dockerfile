FROM buildpack-deps:bullseye

ENV NODE_MAJOR_VERSION 18
ENV YARN_VERSION 1.9.2
ENV RUBY_MAJOR 2.7
ENV RUBY_VERSION 2.7.8
ENV NVM_VERSION 0.39.7

# skip installing gem documentation
RUN mkdir -p /usr/local/etc && \
  { \
    echo 'install: --no-document'; \
    echo 'update: --no-document'; \
  } >> /usr/local/etc/gemrc && \
  { \
    echo "export PATH=/root/.rbenv/bin:/root/.rbenv/shims:\$PATH"; \
  } >> ~/.bashrc

RUN . ~/.bashrc && \
    apt-get update && \
    apt-get install -y apt-transport-https bash && \
    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash && \
    curl -o- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    apt-get install -y rbenv && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends yarn && \
    curl -o- "https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh" | bash && \
    rm -rf /var/lib/apt/lists/*

# Install nodejs, yarn, and ruby default versions
RUN . ~/.bashrc && \
    rbenv install -l && \
    nvm install "${NODE_MAJOR_VERSION}" && \
    nvm alias default "${NODE_MAJOR_VERSION}" && \
    rbenv install "${RUBY_VERSION}" && \
    rbenv global "${RUBY_VERSION}" && \
    gem update --system

