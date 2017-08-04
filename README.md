# Rails Dev
A simple rails image for rails development

## Sample docker-compose.yml
```
version: '3'

services:

   rails:
    #  depends_on:
    #    - db
     image: renocollective/rails
     volumes:
       - ./:/var/www/app
     ports:
       - "3000:3000"
     restart: always
    #  environment:

```
