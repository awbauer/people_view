Tags API
========
Use the Tags API explicitly to discriminate people by a tag given to them.  People tags are created implicitly by their use in the people API.

Index Endpoint
--------------
Show the tags that have been used before in a nation.

```
GET /api/v1/tags
```

### Parameters
* page - page number (optional, default 1)
* per_page - number of results to show per page (optional, default 10, max 100)

### Example

```
GET https://foobar.nationbuilder.com/api/v1/tags
```

```json
{
  "page": 1,
  "total_pages": 1,
  "per_page": 10,
  "total": 3,
  "results": [
    {
      "name": "doctor who"
    },
    {
      "name": "alien"
    },
    {
      "name": "human"
    }
  ]
}
```

People Endpoint
---------------
Search for people who have been tagged with the given tag.  Full representations will be returned.

```
GET /api/v1/tags/:tag/people
```

### Parameters
* page - page number (optional, default 1)
* per_page - number of results to show per page (optional, default 10, max 100)

### Example

To get the people who have been marked as 'doctor who', for example, you would issue this request:

```
GET https://foobar.nationbuilder.com/api/v1/tags/doctor%20who/people
```

And you will receive a response like this:

```json
{
  "results": [
    {
      "first_name": "Jack",
      "last_name": "Harkness",
      "email": "jack@torchwood.com",
      ...
    },
    {
      "first_name": "unknown",
      "last_name": "Who",
      "email": "thedoctor@tardis.com",
      ...
    }
  ]
}
```
