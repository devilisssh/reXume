# ReXume

## Pre-Requisites

The following should be installed on your system in order to run the app locally:

* Ruby 2.3 (Preferred way is to install via RVM https://rvm.io)
* MySQL
* PostgreSQL
* Sphinx
* Install the `bundler` gem via:
```
gem install bundler
```

Installing Ruby via RVM will install tools like Make, gcc etc if they are not installed, which will help in installation of other Ruby Gems as well

## Setup

Clone the repo and go to the root folder.

* Do a `bundle install`. This will install all the Gems needed by the app.

* Run `bundle exec rake db:create db:migrate db:seed`. This would create the development and the test databases, run migrations, and add seed data.

* Run `bundle exec rails server`. This will fire up the app server at port `3000`. You can visit `http://localhost:3000` on you rbrowser and you should see the app homepage.