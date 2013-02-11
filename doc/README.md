# API Documentation

NationBuilder offers a RESTful API that you can use to build great apps to expand and interact with your existing nations.


## Basic Concept

Since this is an early preview of the API, only admin accounts have the access to create, authenticate, and consume API at this moment, but this will change in the future.

To start, you will need to create a new OAuth Application in your nation's control panel.


## Authentication

NationBuilder API's authentication system is built around [Version 22 of The OAuth 2.0 Authorization Protocol](http://tools.ietf.org/html/draft-ietf-oauth-v2-22). In order to consume the API, you will need to create a new OAuth Application in your nation's control panel. Once you have done this, you will receive a Consumer Key and a Consumer Secret.

Listed below is the OAuth 2 authorize and token urls provided by NationBuilder API:

**Authorize URL**

```
https://<nation_slug>.nationbuilder.com/oauth/authorize
```

**Token URL**

```
https://<nation_slug>.nationbuilder.com/oauth/token
```

[In depth instruction](https://github.com/3dna/people_view/blob/master/doc/authentication.md)

NationBuilder API is known to work with the following clients:

* [oauth2](https://rubygems.org/gems/oauth2) ruby gem



## Consuming NationBuilder API

After successful Authentication, you should have the Access Token neseccary for consuming the API. The Access Token should be set in the Authorization Header. If you are using an OAuth2 client, then you do not need to set this header manually.

NationBuilder API uses JSON as the transfer protocol. You will need to set the following headers in addition to the OAuth2 Authorization Header to properly consume the API:

* `Accept: application/json`
* `Content-Type: application/json`

All endpoints are relative to the following url:

`https://<nation_slug>.nationbuilder.com`


## Available Resources and Endpoints

* [Person](https://github.com/3dna/people_view/blob/master/doc/person.md)
* [Survey](https://github.com/3dna/people_view/blob/master/doc/survey.md)