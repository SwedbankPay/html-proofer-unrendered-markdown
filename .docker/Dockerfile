FROM ruby:2.6

WORKDIR /gem
COPY . /gem
RUN gem install bundler
RUN bundle install

# Start the main process.
CMD ["rake"]