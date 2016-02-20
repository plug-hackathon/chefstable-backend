FROM ruby:2.3.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Create the workdir
RUN mkdir /app
WORKDIR /app

# Copy gemfiles and install gem dependencies
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

# Add the source code for our app
ADD . /app
