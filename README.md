# UPrint 2016
## UPrint is a cloud printing service wherein you can send files online so that an available printing shop can print your files.
---
## Installation and Preparation
### Database

Install Postgres:

```
sudo apt-get install libssl-dev postgresql libpq5 libpq-dev
```

Create a Postgres user for UPrint. To do this, switch into the Postgres user:

```
sudo -u postgres psql postgres
```

Then create a user (or a "role", as Postgres calls it):

```
create role "uprint" with createdb login password 'password';
```

Quit the postgre REPL by typing ```\q```.

### Rails

Install Rbenv:

Complete the [installation instructions](https://github.com/sstephenson/rbenv) including the optional part: ```ruby-build```.

Upon installing rbenv, install Ruby 2.2.0:

```
rbenv install 2.2.0
rbenv global 2.2.0
```

Install Rails and Bundler:

```
gem install rails
gem install bundler  # restart terminal after the installation
```

Clone the repository to your own directory, then go to ```api/``` directory. Run the following commands:

```
bundle install
rake db:setup
```

There will be a few ready-to-use accounts. Check out uprint/db/seeds.rb for the sign-in credentials.

### Environment

Paste this in your ```~/.bashrc``` or ```~/.bash_profile```:

```
export GMAIL_USERNAME="uprint2016@gmail.com"
export GMAIL_PASSWORD="UPCSI#00c6d7"
export SENDGRID_USERNAME="app50611309@heroku.com"
export SENDGRID_PASSWORD="v7sbokcv5526"
```

These lines define the credentials for sending confirmation emails. **Do remember to restart the terminal to apply the changes.**

Define these environmental variables in the Heroku config as well, when deploying to Heroku.

**Do note that the Sendgrid credentials may vary when redeploying it to Heroku.**

---
## Starting the App

Go to the ```app/``` directory and start the Rails app.

```
cd path/to/uprint
rails s 
```

---
## Deployment to Heroku

Refer to the following links for reference as to how to deploy a Ruby on Rails app to Heroku, including the addons Sendgrid and PostgreSQL for Heroku.

* [Getting Started with Rails 4.x on Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails4)
* [Getting Started with Ruby on Heroku](https://devcenter.heroku.com/articles/getting-started-with-ruby#introduction)
* [Sendgrid Addon for Heroku](https://devcenter.heroku.com/articles/sendgrid)
* [Postgres Addon for Heroku](https://elements.heroku.com/addons/heroku-postgresql)
