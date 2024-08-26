
# Dockerfile Ubuntu 24.04 & PHP 8.3 for laravel 11

In this repository, you'll find a Dockerfile designed to create a Docker image that simplifies running a Docker container for your Laravel 11 project. Follow the steps below to set it up and get it running smoothly:



## Step 1
clone the repo to your local machine and open the Terminal and run:
```console
docker build --tag 'ubuntu-24-php-8.3' .
```
> **_NOTE:_**  you can change **ubuntu-24-php-8.3** to any name you want.

## Step 2
Run the build command after you open the cloned repo folder
```console
cd /cloned/repo/folder/path/

docker run -p 8883:80 --name 'my-laravel-11-container' -it --mount src=${PWD}/www/,target=/var/www/html,type=bind ubuntu-24-php-8.3;
```

## Step 3
open new terminal and run command:
```console
 docker exec -it my-laravel-11-container bash
 
 cd /var/www/html && rm index.html

 composer create-project laravel/laravel .
```

## Finished
You now have a server running a Laravel 11 project.

> **_NOTE:_** This server does not include MySQL because we have set up MySQL as a separate container, along with phpMyAdmin, and connected the Laravel app to the database network.

> **_NOTE:_** I will soon provide a separate updated Dockerfile for MySQL and phpMyAdmin.


## Authors

- [@abbastotah](https://www.github.com/abbastotah)

