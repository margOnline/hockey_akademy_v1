Hockey Akademy
==============

Standard setup
--------------

1.  Install [rvm](http://rvm.beginrescueend.com/) if haven't already.

2.  In Terminal, go to your projects directory and clone the project:

        cd ~/Documents/Projects/
        git clone git@github.com:margOnline/hockey_akademy_v1.git
        cd into the new project directory

3.  Install gem dependencies:

        bundle install

3.  Save a copy of `config/database.yml.example` as `config/database.yml`.
    In the `development` and `test` sections, update the username, password
    (optional), and database values. Do the same for any other `*.yml.example`
    files in `config/`.

5.  Create and set up the databases:

        rake db:create:all
        rake db:migrate
        rake db:seed

6.  Run tests to make sure they pass with your environment:

        rake test

7.  Run the app! Boot your web server of choice. Options include:

    * Unicorn:

            gem install unicorn
            unicorn -p 3000

    * Mongrel:

            gem install mongrel
            EVENT=1 mongrel_rails start -e development -p 3000

    * [Passenger](http://www.modrails.com/install.html)

    * The Rails default: `rails server`

