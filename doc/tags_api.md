Tags API
========
Use the Tags API explicitly to discriminate people by a tag given to them.  People tags are created implicitly by their use in the people API.

People Endpoint
---------------
Search for people who have been tagged with the given tag.  Full representations will be returned.

```
GET /api/v1/tags/:tag/people
```

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
