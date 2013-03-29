NationBuilder Sample API Client
===============================

Installation
-------------
### Prerequisites:
* [git](http://git-scm.com/book/en/Getting-Started-Installing-Git)
* [ruby](http://www.ruby-lang.org/en/downloads/)
* [bundler](http://gembundler.com/)

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

Usage
-----

### Authentication

When you navigate to the sample app root path, you should see an empty page.

1. Click "New Nation" to register a nation with this sample application
2. At this point you will need an application that has a redirect_uri of the host you are using:
    * Go to an API-whitelisted nation's control panel
    * Navigate links from Settings > OAuth > New Application
    * Name this application, for example "People View Local"
    * Set the Redirect URI to the fully qualified domain name and protocol you are using, with the path "callback", ex. "http://localhost:3000/callback"
    * Click "Register" and note your client uid and secret key for the next step
3. Fill in the details of your nation:
    * Give it a meaningful name. ex. Foobar Nation
    * Provide the url, including https protocol. ex. https://foobar.nationbuilder.com/
    * Provide the client uid and secret key you got from registration of your app
    * The file input is for a logo, feel free into upload an image
4. When you submit the form you should be redirected to the nation selection page.  Select your nation there and it should take you through the authorization process.
5. Optionally sign into your nation
6. When you accept the request to use the data, you should be redirected to the people list
