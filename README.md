# Rails Dev
A simple rails image for rails development

## Sample docker-compose.yml
```
version: '3'

services:

  db:
    image: postgres:10.1
    volumes:
      - ./db_data:/var/lib/postgresql/data
    ports:
      - "3309:3306"
    restart: always
    env_file:
      - ./.env.local

  rails:
    depends_on:
      - db
    links:
      - db
    #image: renocollective/rails
    build: ../member-portal-docker
    volumes:
      - ./:/app
      - box:/box
    ports:
      - "3000:3000"
    restart: always
    env_file:
      - ./.env.local

  box:
   image: busybox
   volumes:
     - box:/box

```
