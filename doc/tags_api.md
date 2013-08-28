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
      "name": "doctor_who"
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

To get the people who have been marked as 'doctor_who', for example, you would issue this request:

```
GET https://foobar.nationbuilder.com/api/v1/tags/doctor_who/people
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

Taggings Index
--------------
This returns a complete list of all the taggings for a given person.

```
GET /api/v1/people/:id/taggings
```

### Parameters
None

### Example

To get the taggings for person with ID 10010, for example, you would issue this request:

```
GET https://foobar.nationbuilder.com/api/v1/people/69974/taggings
```

And you will receive a response code of 200 and body like this:

```json
{
  "taggings": [
    {
      "person_id": 69974,
      "tag": "writer"
    },
    {
      "person_id": 69974,
      "tag": "gardener"
    },
    {
      "person_id": 69974,
      "tag": "camper"
    }
  ]
}
```

Person Tag Endpoint
-------------------
This tags a person with a taggings.

```
PUT /api/v1/people/:id/taggings
```

### Parameters
* `tagging` - the details of the tagging, with attribute:
* `tag` - the tag you wish to add to the person

### Example

To add the tagging "bird_watcher" to the person with ID 69974, for example, you issue this request:

```
PUT https://foobar.nationbuilder.com/api/v1/people/69974/taggings
```

with this body
```json
{
  "tagging": {
    "tag": "bird_watcher"
  }
}
```

And you will receive a response code of 200 and a body like this:
```json
{
  "tagging": {
    "person_id": 69974,
    "tag": "bird_watcher"
  }
}
```

Tag Removal Endpoint
--------------------
This removes a tag from a person.

```
DELETE /api/v1/people/:id/taggings/:tag
```


### Example
To remove the tagging "bird_watcher" from the person with ID 69974, for example, you issue this request:

```
DELETE https://foobar.nationbuilder.com/api/v1/people/69974/taggings/bird_watcher
```

And you will receive a response code of 204.
