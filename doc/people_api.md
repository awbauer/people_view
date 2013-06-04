People API
==========

Index Endpoint
--------------

Use the index endpoint to get a paginated list of the people in a nation.  Each person's data is abbreviated for the index's view, to get a full representation use the Show endpoint

```
GET /api/v1/people
```

### Parameters
* page - result page number
* per_page - number of results to return (max 100)

### Example

```
GET https://foobar.nationbuilder.com/api/v1/people?page=2
```

```json
{
  "page": 2,
  "total_pages": 2,
  "per_page": 10,
  "total": 13,
  "results": [
    {
      "id": 30,
      "first_name": "Lenny",
      "last_name": "Loosejocks",
      "email": "lennyloosejocks@pullyapantsup.com",
      "phone": null,
      "mobile": null,
      "birthdate": null,
      "sex": null,
      "primary_address": null
    },
    {
      "id": 41,
      "first_name": "Roland",
      "last_name": "Pryzbylewski",
      "email": "roland@pryzbylewski.com",
      "phone": null,
      "mobile": null,
      "birthdate": null,
      "sex": null,
      "primary_address": null
    },
    {
      "id": 9,
      "first_name": "Byron",
      "last_name": "Anderson",
      "email": "byron@nationbuilder.com",
      "phone": null,
      "mobile": null,
      "birthdate": null,
      "sex": null,
      "primary_address": null
    }
  ]
}
```

Show Endpoint
-------------

Returns a full representation of the person with the provided id.  Takes no parameters.

```
GET /api/v1/people/:id
```

### Example

A request like this:

```
GET /api/v1/people/9
```

Should respond with status code 200 and a body like this:

```json
{
  "person": {
    "id": 9,
    "first_name": "Byron",
    "last_name": "Anderson",
    "email": "byron@nationbuilder.com",
    "phone": null,
    "mobile": null,
    "birthdate": null,
    "sex": null,
    "note": null,
    "primary_address": {
      "address1": "123 Fake St",
      "address2": null,
      "city": "Beverly Hills",
      "state": "CA",
      "country_code": "US",
      "zip": "90201",
      "lat": null,
      "lng": null
    },
    "home_address": null
  }
}
```

Match Endpoint
--------------

Use the match endpoint to find people that have certain attributes

```
GET /api/v1/people/match
```

### Parameters

Parameters act as matching criteria.
* email - email address
* first_name - first name
* last_name - last name
* phone - phone number
* mobile - mobile number

### Example

A request like this:

```
GET https://foobar.nationbuilder.com/api/v1/people/match?email=byron@nationbuilder.com
```

Should get a response like this if the person exists:

```json
{
  "person": {
    "id": 9,
    "first_name": "Byron",
    "last_name": "Anderson",
    "email": "byron@nationbuilder.com",
    "phone": null,
    "mobile": null,
    "birthdate": null,
    "sex": null,
    "note": null,
    "primary_address": {
      "address1": "123 Fake St",
      "address2": null,
      "city": "Beverly Hills",
      "state": "CA",
      "country_code": "US",
      "zip": "90201",
      "lat": null,
      "lng": null
    },
    "home_address": null
  }
}
```

Search Endpoint
---------------
Search for people with non-unique traits of their first and last names, and their primary address city and state.
A maximum of 20 people will be returned.

GET /api/v1/people/match

### Parameters
* first_name - first name search parameter
* last_name - last name search parameter
* city - city of the primary address of people to match
* state - state of the primary address of people to match
* sex - sex of the people to match (optional, M or F)
* birthdate - Date of birth of the people to match

### Example

```json
{
  "first_name": "Byron",
  "city": "Beverly Hills",
  "first_name": "CA"
}
```

```json
{
  "results": [{
    "id": 9,
    "first_name": "Byron",
    "last_name": "Anderson",
    "email": "byron@nationbuilder.com",
    "sex": null,
    "birthdate": null,
    "phone": null,
    "mobile": null,
    "primary_address": {
      "address1": "123 Fake St",
      "address2": null,
      "city": "Beverly Hills",
      "state": "CA",
      "country_code": "US",
      "zip": "90201",
      "lat": null,
      "lng": null
    }
  }]
}
```

Nearby Endpoint
---------------

Searches for people near a location defined by latitude and longitude

```
GET /api/v1/people/nearby
```

### Parameters
* location - origin of search in the format latitude,longitude (required)
* distance - the radius in miles for which to include results (optional, default 1 mile)
* page - page number (default 1)
* per_page - number of results to show per page (default 10, max 100)

### Example

If I wanted to search for the people in my nation that live within a mile of Coors Field in Denver, I would issue a request like this:

```
GET https://foobar.nationbuilder.com/api/v1/people/nearby?location=39.755417,-104.993834&distance=1
```

I should receive a response like this:

```
{
  "page": 1,
  "total_pages": 1,
  "per_page": 10,
  "total": 1,
  "results": [
    {
      "id": 48,
      "first_name": "Ezekiel",
      "last_name": "Smith",
      "email": "ezekiel@smith.com",
      "primary_address": {
        "address1": "1700 Bassett St",
        "address2": null,
        "city": "Denver",
        "state": "CO",
        "country_code": "US",
        "zip": "80202",
        "lat": "39.756461",
        "lng": "-105.003145"
      },
      "phone": null,
      "mobile": null,
      "home_address": {
        "address1": "1700 Bassett St",
        "address2": null,
        "city": "Denver",
        "state": "CO",
        "country_code": "US",
        "zip": "80202",
        "lat": "39.756461",
        "lng": "-105.003145"
      }
    }
  ]
}
```

Create Endpoint
---------------

Creates a person with the provided data.  Returns a full representation of the person who was created.  Returns errors if the creation fails.

```
POST /api/v1/people
```

### Parameters

* person - the json representation of the person to be created
* first_name - the person's first name and middle names
* last_name - the person's last name
* email - the person's email address
* phone - the person's home phone number
* mobile - the person's cell phone number
* birthdate - the person's birthdate
* sex - the person's sex (M or F)
* note - a note to attach to the person's profile
* home_address - an address object representing the person's home
    * address1 - first address line
    * address2 - second address line
    * city - city
    * state - state
    * zip - zip code
    * country_code - country code
    * lat - latitude (using WGS-84)
    * lng - longitude (using WGS-84)

### Example

Make the request:

```
POST /api/v1/people
```

With attached body content like this:

```json
{
  "person": {
    "first_name": "John",
    "last_name": "Doe",
    "email": "johndoe@gmail.com",
    "home_address": {
      "address1": "123 Fake St",
      "city": "Lakewood",
      "state": "CO",
      "zip": "80227"
    }
  }
}
```
You will receive a response of status 200, with response body like this:

```json
{
  "person": {
    "id": 54,
    "first_name": "John",
    "last_name": "Doe",
    "email": "johndoe@gmail.com",
    "phone": null,
    "mobile": null,
    "sex": null,
    "birthdate": null,
    "note": null,
    "primary_address": null,
    "home_address": {
      "address1": "123 Fake St",
      "city": "Lakewood",
      "state": "CO",
      "zip": "80227"
    }
  }
}
```

Update Endpoint
---------------

Updates the person with the provided id to have the provided data. Returns a full representation of the updated person.  Returns errors if the updating fails.

```
PUT /api/v1/people/:id
```

### Parameters

* person - the json representation of the person to be created
* first_name - the person's first name and middle names
* last_name - the person's last name
* email - the person's email address
* phone - the person's home phone number
* mobile - the person's cell phone number
* birthdate - the person's birthdate
* sex - the person's sex (M or F)
* note - a note to attach to the person's profile
* home_address - an address object representing the person's home
    * address1 - first address line
    * address2 - second address line
    * city - city
    * state - state
    * zip - zip code
    * country_code - country code
    * lat - latitude (using WGS-84)
    * lng - longitude (using WGS-84)

### Example

Make this request (assuming you have a person with id 54):

```
PUT /api/v1/people/54
```

With request body like this:

```json
{
  "person": {
    "first_name": "John",
    "email": "johndoe@gmail.com",
    "phone": "303-555-0841"
  }
}
```

You will receive a response of status 201 and body response like this:

```json
{
  "person": {
    "id": 54,
    "first_name": "John",
    "last_name": "Doe",
    "email": "kiaramohr@gmail.com",
    "phone": "3035550841",
    "mobile": null,
    "birthdate": null,
    "sex": null,
    "note": null,
    "primary_address": null
  }
}
```

Push Endpoint
-------------
Updates person matched, or creates if no match is found.  Matches are found exclusively by email address.

```
PUT /api/v1/people/push
```

### Update Example
Assuming there is a person with the email address "byron@foobarsoftwares.com" in the Foobar nation, this request:

```
PUT https://foobar.nationbuilder.com/api/v1/people/push
```

With this attached request body:

```json
{
  "person": {
    "email": "byron@foobarsoftwares.com",
    "last_name": "Erastos",
    "sex": "M"
  }
}
```

Should update the existing record to have the new name and sex, return status code 200, and this body:

```json
{
  "person": {
    "id": 184,
    "email": "byron@foobarsoftwares.com",
    "first_name": "Byron",
    "last_name": "Erastos",
    "sex": "M"
    "birthdate": null,
    "primary_address": null
  }
}
```

### Creation example
Assuming there is no matching person in the Foobar nation

```
PUT https://foobar.nationbuilder.com/api/v1/people/push
```

With this attached request body:

```json
{
  "person": {
    "email": "byron@foobarsoftwares.com",
    "first_name": "Byron",
    "last_name": "Erastos",
    "sex": "M"
  }
}
```

Should create a new record with those attributes, return status code 200, and this body:

```json
{
  "person": {
    "id": 184,
    "email": "byron@foobarsoftwares.com",
    "first_name": "Byron",
    "last_name": "Erastos",
    "sex": "M"
    "birthdate": null,
    "primary_address": null
  }
}
```

Destroy Endpoint
----------------
Removes the person with the provided id from the nation.  Takes no parameters, returns response code 204 on success.

```
DELETE /api/v1/people/:id
```

Register Endpoint
-----------------

Starts user registration process for the given person.  Specifically sends an account confirmation email.

```
GET /api/v1/people/:id/register
```

### Example
For a person with id 123 on foobar nation

```
GET https://foobar.nationbuilder.com/api/v1/people/123/register
```

This should get you an of success or failure like this:

```json
{
  "status": "success"
}
```

Success means that the account activation email was sent successfully
