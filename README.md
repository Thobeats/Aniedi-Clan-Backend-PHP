
# Thrive Health - API

## This the Documentation for the backend api (Please Read Me)

* to be added

### Contains associative routes

* to be added

## Features

* to be added

## Features

* to be added

## Installation

* clone this repo
* cd into the project folder
* Run composer install to install depedencies
* Run `php artisan serve`
* visit localhost:8000 in your web browser

## If laravel is installed 

* clone this repo
* cd into the project folder and run `php artisan serve`
* visit localhost:8000 in your web browser

## Rules for sending PR

* attach a brief and concise description of what you have done
* outline the steps to be taken in order to test the feature you added
* attach a screenshot or gif of what you did, if possible
* Create a branch 
* do not send PR to the master branch


## Setting up for testing
You will need PHP >= 7.2, [Composer](https://getcomposer.org/) and an SQL Database to get started.
MySql preferred.

* Clone this repository
* Run `composer install` to install dependencies
* Copy `.env.example` to `.env` and edit the contents to match your environment
configurations. **For testing purposes, you may keep the .env file provided in the repo for uniformity**
* Run ```php artisan migrate``` to set up the DB
* Run ```php artisan key:generate``` to  generate the application key
* For testing and development purposes, run ```php artisan serve```. You can then access the app at http://localhost:8000 on your browser
