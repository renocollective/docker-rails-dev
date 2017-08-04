FROM ruby:2.3.1


# Install essential linux packages
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    bash \
    build-essential \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

    # Define where the application will live inside the image
    ENV RAILS_ROOT /var/www/app

    # Create application home. App server will need the pids dir
    RUN mkdir -p $RAILS_ROOT/tmp/pids

    # Set our working directory inside the image
    WORKDIR $RAILS_ROOT


# Install bundler
RUN gem install bundler

# Use the Gemfiles as Docker cache markers and run bundle install before copy over app src
#COPY Gemfile Gemfile
#COPY Gemfile.lock Gemfile.lock


#RUN bundle install --deployment

#RUN rails db:migrate

CMD bundle install --deployment && rails db:migrate && rails s
