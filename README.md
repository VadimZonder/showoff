# ShowOff App Client Exercise

This is a client application that interacts with Widget, Authentication and User Management APIs.
This application is makes calls to these APIs and uses its responses to enable users interaction with them. 

# Development
Application is built using Ruby on Rails 5.2.0 and Ruby version 2.5.1
=> may need to run '$rvm install 2.5.1' to update the ruby version
Some of the essential gems used: rest-client, bootsnap, puma.

# Deploying Locally
Clone the repo locally and run:

# install gems
$ bundle install

# setup the database
$ bundle exec rake db:setup

# run the server
$ rails s

# run the rails console
$ rails c

# In order to run the application: may need to run this command to enable the postgresql before running the server.
$ sudo service postgresql start

#if getting a DB error then try running
4rake db:create:all
and
$rake db:migrate

## Deploying to Heroku

sh
$ heroku create
$ git push heroku master
$ rake assets:precompile RAILS_ENV=production
$ heroku open
 

## Navigation
Make sure to register first and then login in.
Only then other functionalities can be accessed.

# Links to view the app
# Cloud 9 
https://showoff-vadimmalakhovski.c9users.io/
# Heroku
https://showoff-your-app.herokuapp.com/

# For best results run on Google Chrome


