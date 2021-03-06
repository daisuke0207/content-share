FROM ruby:2.5
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    yarn
RUN gem install sass
WORKDIR /content-share
COPY Gemfile Gemfile.lock /content-share/
RUN bundle install