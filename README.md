NationBuilder Sample API Client
===============================

Installation
-------------
### Prerequisites:
* git
* ruby
* bundler

### Steps:
1. In order to use this sample application, clone the repository and cd to it:

  ```
    git clone https://github.com/3dna/people_view
    cd people_view
  ```

2. Once inside, you must install the project's dependencies with bundler:

  ```
    bundle install
  ```

3. Once the bundling process completes, you need to provide database credentials in config/database.yml

  ```
    cp config/database.yml.example config/database.yml
    # edit database.yml to match your configuration.  The example file is sufficient to start
  ```

4. Migrate the database you set up:

  ```
    bundle exec rake db:migrate db:test:prepare
  ```

5. Run the server:

  ```
    bundle exec script/rails server
  ```

Now you should be able to use the application, just navigate to [http://localhost:3000](http://localhost:3000) by default


Please read the [API documentation](https://github.com/3dna/people_view/blob/master/doc/README.md) for more information on API usage.
