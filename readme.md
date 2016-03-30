# UPrint 2016
## UPrint is a cloud printing service wherein you can send files online so that an available printing shop can print your files.

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

## Starting the App

Go to the ```app/``` directory and start the Rails app.

```
cd path/to/uprint
rails s 
```
