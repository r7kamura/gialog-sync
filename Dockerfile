FROM ruby:2.7.6

ENV BUNDLE_GEMFILE /app/Gemfile

WORKDIR /app

COPY Gemfile Gemfile.lock /app/
RUN bundle install

COPY entrypoint.sh main.rb /app/

ENTRYPOINT ["/app/entrypoint.sh"]
