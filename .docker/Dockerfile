FROM ruby:2.6

WORKDIR /gem
COPY . /gem
RUN bundle install

# Start the main process.
CMD ["rake", "test"]