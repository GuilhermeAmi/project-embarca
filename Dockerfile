FROM ruby:2.7.0


RUN apt-get update -qq && apt-get install -y nodejs postgresql-client


RUN mkdir /myapp
WORKDIR /myapp


COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN gem install bundler:2.2.0
RUN bundle install


COPY . /myapp


EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]
