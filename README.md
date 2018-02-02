# Rails Dev
A simple rails image for rails development

## Setup
Modify the docker-compose.yml paths to point at your rails app.
Be sure the .env.local file is also correctly targeted.

Sample .env.local file contents:
```# dotenv .env file for environment variables
#
# each developer should make their own .env.local file using this .env file
# as a guide
#
# .env.local files are not checked into the remote repo
#
# reference these attributes in code like this:
# config.fog_directory  = ENV['S3_BUCKET']

S3_BUCKET=bogus-key-for-example
POSTGRES_HOST=db
POSTGRES_DB=member_portal
POSTGRES_USER=member_portal
POSTGRES_PASSWORD=somereallygreatpasswordthatsbetterthanthisone
SECRET_KEY_BASE=insecure-secret_key_base
```

## Usage
* To run rails in docker
* ```docker-compose up``` or ```docker-compose up -d``` to not show console output.
* DB Migrate: (can be run without rebooting container, just open a new terminal)
* ```docker-compose run --rm rails rails db:migrate RAILS_ENV=development```
