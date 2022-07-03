FROM ruby:3.0.1
WORKDIR /opt/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
RUN chmod +x scripts/start.sh
CMD ["./scripts/start.sh"]