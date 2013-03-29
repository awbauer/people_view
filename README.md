NationBuilder Sample API Client
===============================

Installation
-------------
### Prerequisites:
* git
* ruby
* bundler

### Steps:
In order to use this sample application, clone the repository and cd to it:

```bash
  git clone https://github.com/3dna/people_view
  cd people_view
```

Once inside, you must install the project's dependencies with bundler:

```bash
  bundle install
```

Once the bundling process completes, you need to provide database credentials in config/database.yml

```bash
  cp config/database.yml.example config/database.yml
  # edit database.yml to match your configuration.  The example file is sufficient to start
```

Migrate the database you set up:

```bash
  bundle exec rake db:migrate db:test:prepare
```

Run the server:

```bash
  bundle exec script/rails server
```

Now you should be able to use the application, just navigate to [http://localhost:3000](http://localhost:3000) by default


Please read the [API documentation](https://github.com/3dna/people_view/blob/master/doc/README.md) for more information on API usage.
