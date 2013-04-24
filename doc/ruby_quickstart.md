Ruby Quickstart API Guide
===========================

In the Ruby programming language, a gem called OAuth2 encapsulates much of the functionality necessary to speak to an OAuth 2 compliant API.  Here is an example of using the OAuth2 gem to interact with NationBuilder.

First you need to build a client object that represents your application.  Make sure to plug in your applicable values for the nation slug, application client id, application secret key, and redirect_uri.

```ruby
require 'oauth2'
site_path = 'https://foobar.nationbuilder.com'
redirect_uri = 'http://www.myapp.com/oauth_callback'
client = OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, :site => site_path)
```

The client will build the authorization url for you, just have the resource owner visit the page it builds.

```ruby
client.auth_code.authorize_url(:redirect_uri => redirect_uri)
# => "https://foobar.nationbuilder.com/oauth/authorize?response_type=code&client_id=...&redirect_uri=http%3A%2F%2Fwww.myapp.com%2Foauth_callback"
```

Once you get the authorization code, you can request an access token.

```ruby
token = client.auth_code.get_token(code, redirect_uri: redirect_uri)
```

With the token object you receive, you can start consuming resources.

```ruby
response = token.get('/api/v1/people', :headers => { 'Accept' => 'application/json' }, :params => { page: 1 })
```

This response will have a JSON body which can be interpreted into a native hash object.

```ruby
require 'json'
hash = JSON.parse(response.body)
```

Visit [oauth2 gem](http://rdoc.info/github/intridea/oauth2) for more information
