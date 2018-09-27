# How do I QA?
Introduction to acceptance testing

FORK THE PROJECT! 
>(Forking is creating your own instance of the project, where you can make all the changes you want, and commit your specs without spoiling the fun to anyone else. To fork the project, look for `Fork` button at the top right corner of this page.)

# Dependencies
**Download and set these up first.**  
- MacOS up to date (older versions may not allow you to install Xcode)
- Xcode (download from AppStore, run and accept the T&C, then run `xcode-select --install`)
- RVM (Ruby Version Manager, instructions on how to install available here: https://rvm.io/rvm/install)
- Ruby 2.1.5  (once RVM is installed, run `rvm install 2.1.5`. Additional support available also at the link above.)
- Homebrew (package manager, instructions on how to install available here: https://brew.sh/)
- PostgreSQL  (database, run `brew install postgresql`)

## Gem dependencies
- Capybara Webkit Driver & QT application framework (instructions on how to install those is available here (go with the Homebrew path): https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit#macos-high-sierra-1013-macos-sierra-1012-el-capitan-1011-and-yosemite-1010)

# Database setup
We're using postgres. Make sure it's running, before you proceed.
(the easiest way to check it is to run 
`ps auxwww | grep postgres` 
and look for a command that looks something like this (your version may not be 8.3):

`/Library/PostgreSQL/8.3/bin/postgres -D /Library/PostgreSQL/8.3/data`

>If for some reason, the server is not running, you can start it by running this command: 
`pg_ctl -D /usr/local/var/postgres start`

Then log in to template with this command line:  

Ubuntu: `sudo -u postgres psql template1`  
MacOS: `psql template1`  

You will now be in psql command line.  
After that in the console run the development setup script - this script is already filled in with passwords, etc.  
If you want to change any of the information in there you will need to change it also in database.yml later!

In the pql console run: `\i <PATH_TO_PROJECT>/db/development_setup_script.sql` (you can get the current path by typing `pwd`)

Exit pql console by typing `\q`  

**Copy database.yml.sample to database.yml**:  
`cp config/database.yml.sample config/database.yml`  

Run `bundle install` to install all the needed gems (this step is complete once all gems listed by this command are green).
Then `rake db:reseed` to populate development environment with example data.  
Load test database with `rake db:test:load`.  


# Credentials
**Seeds have a user already created for you.**  
`admin@example.com` with password `12345678`  

# Run server
`rails s` 

To access the page, type `http://localhost:3000/` in the browser address bar.

# Run specs (if any)
`rspec spec`  
