<p align="center">
  <img src="https://i.imgur.com/B9CcgOJ.png" /></br></br>
  <img src="https://img.shields.io/badge/Rails-7.1.3.4-2ea44f" alt="Rails - 7.1.3.4">
  <a href="https://"><img src="https://img.shields.io/static/v1?label=Ruby&message=3.3.1&color=%23fc1212" alt="Ruby - 3.3.1"></a>
  <a href="https://"><img src="https://img.shields.io/static/v1?label=Docker&message=4.31.1&color=%23037ffc" alt="Docker - 4.31.1"></a>
  <a href="https://"><img src="https://img.shields.io/static/v1?label=Postgresql&message=14.2&color=%2347a3ff" alt="Postgresql - 14.2"></a>
  <a href="https://"><img src="https://img.shields.io/static/v1?label=Nginx&message=1.27.0&color=%23fcfc12" alt="Nginx - 1.27.0"></a>
  <a href="https://"><img src="https://img.shields.io/static/v1?label=OAuth&message=2.0&color=%23383838" alt="OAuth - 2.0"></a>
  <img src="https://img.shields.io/static/v1?label=RSpec&message=6.1.0&color=8332a8" alt="RSpec - 6.1.0">

  This repository hosts the source code for a comprehensive financial management application designed to streamline CNAB file processing and payment transactions.
</p>

## 1- Author

- [@Lucas Eduardo (KSukoshi)](https://github.com/KSukoshi)

## 2- Features

- User registration, management and login (OAuth included)
- Saves information from the CNAB.txt file
- Creation and management of Payment transactions and methods
- Account total balance

## 3- Docker Image

[DockerHub Image Link](https://hub.docker.com/repository/docker/ksukoshi/desafio-dev-desafio-dev/general)


## 4- Installation

To install this application, first you should install Docker, you can install it through [this link](https://docs.docker.com/engine/install/) and follow it's instructions based on your operating system

Once you do, clone this project to your machine and access it through terminal.

Create a environment file in the main folder of the project to store database and some other information:
```
$ touch env-example
```

Then add the following to the file: 
```
SECRET_TOKEN=Khijo908HJJOOnnuh987hijmn90ol

WORKER_PROCESSES=1
LISTEN_ON=0.0.0.0:8010
DATABASE_URL=postgresql://desafio-dev:test_db_password@postgres:5432/desafio-dev?encoding=utf8&pool=5&timeout=5000
CACHE_URL=redis://redis:6379/0
JOB_WORKER_URL=redis://redis:6379/0
OAUTH_CLIENT=71072192639-0psr6n1l7583v0tn5d13rb81iuihtj50.apps.googleusercontent.com
OATH_TOKEN=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
```
> [!NOTE]  
> The tokens are generated for this test only and should be used as is

Make it into a hidden environment file:
```
$ cp env-example .env
```

Create volumes for PostgreSQL and Redis using the following commands:
```
$ docker volume create --name desafio-dev-postgres
$ docker volume create --name desafio-dev-redis
```
Once the volumes are created, you can build the container in which the project will run
```
$ docker compose up --build
```

Once the container is built, you should access the container's shell to create the database and run migrations/seeds, once inside the container's shell, run the following commands:
```
rake db:create
rake db:migrate
rake db:seed
```

Once the database is set up, stop the container with the command:
```
docker compose stop
```

Then start it again with the command:
```
docker compose up
```
> [!TIP]
> The application should be up and accessible through `http://localhost:8010`

# 5- Testing

To test the application simply access the main folder of the project through the terminal and run the following command:

```
$ bundle exec rspec
```
