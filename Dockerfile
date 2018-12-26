FROM ruby:2.5
# start as root
USER root

# Add a non-root user to prevent files being created with root permissions on host machine.
ARG PUID=1000
ENV PUID ${PUID}
ARG PGID=1000
ENV PGID ${PGID}

# always run apt update when start and after add new source list, then clean up at end.
RUN apt-get update -yqq && \
    apt-get install -y build-essential libpq-dev nodejs && \
    groupadd -g ${PGID} user && \
    useradd -u ${PUID} -g user -m user && \
    usermod -p "*" user

RUN mkdir /src
RUN chown user:user /src

USER user
WORKDIR /src
COPY Gemfile /src/Gemfile
COPY Gemfile.lock /src/Gemfile.lock
RUN bundle install
COPY . /src