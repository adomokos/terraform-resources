FROM ruby:2.7.1
RUN apt-get update -qq
RUN mkdir /rails_terraform
WORKDIR /rails_terraform
COPY Gemfile /rails_terraform/Gemfile
COPY Gemfile.lock /rails_terraform/Gemfile.lock
RUN bundle install
COPY . /rails_terraform

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
