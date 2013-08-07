Webhooks API
============

Use the webhooks API to manage callback requests that you wish to receive on the following types of events:

* Person creation - "person_creation"
* Person update - "person_update"
* Person contact - "person_contact"
* Donation success - "donation_success"
* Donation update - "donation_update"
* Donation cancelation - "donation_cancellation"

Index endpoint
--------------
Returns a paginated list of the webhooks the nation has already registered with this endpoint

### Attributes

* `page` - page number
* `per_page` - the number of results to show per page (default 10, max 100)


### Example

```
GET https://foobar.nationbuilder.com/api/v1/webhooks
```

```json
{
  "page": 1,
  "total_pages": 1,
  "per_page": 10,
  "total": 1,
  "results": [
    {
      "id": "51f6d14dba6d1d31c0000003",
      "url": "http://requestb.in/1hupspb1",
      "event": "person_contact"
    }
  ]
}
```

Show Endpoint
-------------
Show the details of an individual webhook, retrieved by its id

### Example

```
GET https://foobar.nationbuilder.com/api/v1/webhooks/51f6d14dba6d1d31c0000003
```

```json
{
  "webhook": {
    "id": "51f6d14dba6d1d31c0000003",
    "url": "http://requestb.in/1hupspb1",
    "event": "person_contact"
  }
}
```

Create Endpoint
---------------
Use this endpoint to register a webhook to fire on the occurance of a certain event.

### Attributes

* `url` - the URL you want to have the webhook fire towards
* `event` - the event you want to observe (

### Example

```
POST https://foobar.nationbuilder.com/api/v1/webhooks
```

```json
{
  "webhook": {
    "id": "51f6d14dba6d1d31c0000003",
    "url": "http://requestb.in/1hupspb1",
    "event": "person_contact"
  }
}
```

Destroy Endpoint
----------------
Remove a webhook to have NationBuilder stop sending events to the endpoint

### Example

```
DELETE https://foobar.nationbuilder.com/api/v1/webhooks
```

Should remove the webhook and return an empty response with status code 204.
