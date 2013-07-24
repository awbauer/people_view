# NationBuilder OAuth2 Authentication

This guide describes how to authenticate to NationBuilder with OAuth2.

In order to authenticate, you need to know the nation's slug in order to request access to its data. For the rest of this guide we will be using the nation with the slug `foobar` as an example, replace it with your nation's slug.

## Step 1. Authorization Request

To begin you must get an access grant from a person in a nation with the highest permission level - 'admin'.

Note: You can receive an access token to make requests on behalf of a person with permission level 'staffer', but that access token will not allow you to use the endpoints currently documented.  In the future endpoints may be individually segregated into permission level necessary.

To do so, bring the admin to this page:

```
https://foobar.nationbuilder.com/oauth/authorize?client_id=<client_id>&redirect_uri=<redirect_uri>
```

Note: make sure the redirect_uri provided is the same that was provided in application registration.

If the user is not logged in, he will be asked to log in. If the user is logged in, he will be shown a form stating that your application has requested access to their nation, and ask the user to either grant or deny access.


## Step 2. Access Grant

If the user grants access to your request, NationBuilder will redirect back to your application ( specified by `request_uri` ) with a query parameter named `code`.  Exchange that code for an access token:


```
POST https://foobar.nationbuilder.com/oauth/token
    grant_type=authorization_code
    client_id=<client_id>
    redirect_uri=<redirect_uri>
    client_secret=<client_secret>
    code=<code>
```

The response will include an access token:

```
  access_token=<access_token>
```

## Step 3. Request Protected Resources

With the access token, you can now access the protected resources on user's behalf. The `access_token` is used in the HTTP request header like this:


```
GET https://foobar.nationbuilder.com/api/v1/people?

Authorization:  OAuth <access_token>
```

## Ruby Client

In ruby, the OAuth2 library encapsulates the necessary functionality nicely. Here is a brief example on using this gem:

```
require 'oauth2'

site_path = "http://foobar.nationbuilder.com"
redirect_uri = "http://www.myapp.com/oauth_callback"
client = OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, :site => site_path)

client.auth_code.authorize_url(:redirect_uri => redirect_uri)
# => "http://foobar.nationbuilder.com/oauth/authorize?response_type=code&client_id=...&redirect_uri=http%3A%2F%2Fwww.myapp.com%2Foauth_callback"

# Once you get the authorization code, request the access token like so:
token = client.auth_code.get_token(code, redirect_uri: redirect_uri)

# and start consuming data:
response = token.get("/api/v1/people", :headers => { "Accept" => "application/json", "Content-Type" => "application/json" }, :params => { :page => 1 })
```

Please visit http://rdoc.info/github/intridea/oauth2 for more info.
