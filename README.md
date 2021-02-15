# README

## Purpose

This application is designed to give the user an easy interface in which to check the opening price of any given stock. In order to use this functionality, users must first sign up for the application via the built-in onboarding process.

## Dependencies

This application requires Ruby 2.7.2, yarn, and MongoDB. The development instructions assume that the user is using RVM but this is not strictly required (and a substitute like rbenv could be used as well if desired.)

## Running for Development

After cloning this repo, the following steps are needed to run the app:
* `cd` into the project folder and install the required Ruby version if needed using RVM: `rvm install "ruby-2.7.2"`
* run `bundle install`
* run `rails install:webpacker`
* run `rails s` to run the application

## Running in Production

To run the application in a stripped down production environment using docker: 
* Clone the repo on the target machine.
* Run `docker-compose build && docker-compose up` from the project directory. This will start the server as well as a MongoDB instance. Note that as configured, the MongoDB does not mount any volumes from the host. All data in the database will be lost if the docker container is later pruned.