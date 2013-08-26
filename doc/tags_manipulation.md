Tag manipulations in the People API follow these rules:

1. Tags present that are not prepended by the ":" character are added to the person if they are not already tagged it.
2. Tags present that are prepended by the ":" character are removed from the person if they are tagged with it
3. Tags not present in the list remain on the person

Example:

Consider a person with id 123 and these tags:

* blogger
* programmer

After this request:

```
PUT /api/v1/people/123
```

With this attached request body:
```json
{
  "person": {
    "tags": [":blogger", "writer"]
  }
}
```

After the request is fulfilled, the person will have the tags "programmer" and "writer", as formalized by the rules above.
