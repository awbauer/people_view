NationBuilder API Rate Limit Policy
===================================

Updated 8 July 2013

Our API works primarily on a per-nation basis.  This is meant to allow application developers to provide services to many nations without penalty, in the same way that twitter applications are on a per-user basis.  Right now this per-nation rate limit stands at 600 requests per-hour.

However, the API also allows for per-application rate limiting.  Requests will be deducted first from the nation's allocation of requests, and then the application's supply of requests when the nation runs out of requests for a time window.


You can find out about the rate limit your application is experiencing with headers in API responses.

These headers are:

* Nation-RateLimit-Limit - the per-nation rate limit (currently 600)
* Nation-RateLimit-Remaining - the remaining requests in the time window for the nation on which the request was made
* Application-RateLimit-Limit - the per-application rate limit (must be requested)
* Application-RateLimit-Remaining - the remaining requests in the time window that can be spent by the application
* RateLimit-Reset - the time that the rate limit window runs out, in seconds since epoch

For example:

```
Nation-RateLimit-Limit: 600
Nation-RateLimit-Remaining: 598
Application-RateLimit-Limit: 100
Application-RateLimit-Remaining: 100
RateLimit-Reset: 1373326027
```

Please contact (someone) if you run up against our rate limiting and wish to request more.
