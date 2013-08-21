NationBuilder API Rate Limit Policy
===================================

Updated 19 August 2013

Our rate limit is composed of two independent rate limits- per-IP address and per-nation.

The nation rate limit is meant to allow for an application to provide to many nations without penalty, in the same way that twitter applications are on a per-user basis.

The time window for nation rate limiting is a UTC day, meaning it rolls over on the day change in the UTC time zone.

The nation rate limit is determined by the following logic:

<table>
  <tr>
  	<th>Pricing Model</th>
  	<th>Limit</th>
  </tr>
  <tr>
  	<td>v1</td>
  	<td>50,000</td>
  </tr>
  <tr>
  	<td>v2</td>
  	<td>50,000</td>
  </tr>
  <tr>
  	<td>v3</td>
  	<td>Max Signups for pricing tier</td>
  </tr>
</table>

Nations created after August 15, 2013, are automatically on V3 pricing. If you are not sure whether you are on V3 pricing, please contact your organizer or email info@nationbuilder.com and include your nation slug.

Note: For pricing model v3 plans of less than 10,000 max signups, the rate limit is rounded up to 10,000 requests per day.

The IP rate limit is evaluated in order to throttle applications usage on a second-to-second basis, and is currently fixed at 10 requests per second.

You can find out about the rate limit your application is experiencing with headers in API responses.

These headers are:

* Nation-RateLimit-Limit - the per-nation rate limit, see the table above for what you can expect for this value
* Nation-RateLimit-Remaining - the remaining requests in the time window for the nation on which the request was made
* Nation-RateLimit-Reset - the time that the nation rate limit window runs out, in seconds since epoch
* IP-RateLimit-Limit - the per-application rate limit (must be requested)
* IP-RateLimit-Remaining - the remaining requests in the time window that can be spent by the application
* IP-RateLimit-Reset - the time that the rate limit window runs out, in seconds since epoch

For example:

```
Nation-RateLimit-Limit: 10000
Nation-RateLimit-Remaining: 9999
Nation-RateLimit-Reset: 1377043200
IP-RateLimit-Limit: 10
IP-RateLimit-Remaining: 9
IP-RateLimit-Reset: 1377020965
```

Please contact NationBuilder VP of Community [Adriel Hampton](ahampton@nationbuilder.com) if you run up against our rate limiting and wish to request more.
