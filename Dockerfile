FROM ruby:2.3.1

# Install essential linux packages
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    bash \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    postgresql-client \
    libxml2-dev \
    libxslt-dev \
    && rm -rf /var/lib/apt/lists/*

    # Define where the application will live inside the image
    ENV RAILS_ROOT /var/www/app

    # Create application home. App server will need the pids dir
    RUN mkdir -p $RAILS_ROOT/tmp/pids

    # Set our working directory inside the image
    WORKDIR $RAILS_ROOT


# Install bundler
RUN gem install bundler

ENV app /app

RUN mkdir $app
WORKDIR $app

ENV BUNDLE_PATH /box

ADD . $app

COPY script/start.sh /start.sh

ENTRYPOINT ["/start.sh"]

CMD rails s -b 0.0.0.0
