FROM ruby:2.7.6

WORKDIR /app

ENV BUNDLE_GEMFILE /app/Gemfile
ENV BUNDLE_WITHOUT development

COPY Gemfile Gemfile.lock /app/
RUN bundle install

COPY . /app/

ENTRYPOINT ["/app/entrypoint.sh"]
