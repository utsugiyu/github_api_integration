FROM ruby:3.1.2

RUN mkdir /github_api_integration
WORKDIR /github_api_integration
COPY Gemfile /github_api_integration/Gemfile
COPY Gemfile.lock /github_api_integration/Gemfile.lock
RUN gem update bundler && bundle install
COPY . /github_api_integration

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
