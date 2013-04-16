Python Quickstart API Guide
===========================

1. Install [rauth](https://github.com/litl/rauth)
2. Use the Oauth 2 service from rauth
```python
  from rauth import OAuth2Service
```

3. Set up the Oauth 2 service for the nation you want to access
```python
  service = OAuth2Service(
                client_id = "aaaaaaaa",
                client_secret = "bbbbbbb",
                name = "any name",
                authorize_url = nation_slug + ".nationbuilder.com/oauth/authorize",
                access_token_url = "http://" + nation_slug + ".nationbuilder.com/oauth/token",
                base_url = nation_slug + ".nationbuilder.com")
```

4. Get token from code client passes to you from the redirect (see API authentication docs)
```python
  token = service.get_access_token(decoder=json.loads, data = {"code": code,
                                        "redirect_uri": REDIRECT_URI, "grant_type": "authorization_code"})
```

5. Get API session using token
```python
  session = service.get_session(token)
```

6. Get API data using session
``` python
  response = session.get("https://"+nation_slug+".nationbuilder.com/api/v1/people", 
                          params={'format': 'json'}, 
                          headers={'content-type': 'application/json'})
```
