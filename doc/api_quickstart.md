API Authentication Quick-Start Guide
====================================

These are the steps necessary to start using the API:

Note: The API is currently in invite-only alpha.  Changes can and will happen before version 1 is considered stable.  Furthermore, there is currently a rate limit of 600 requests per hour.

1. Register the application

    Log into your nation, navigate to Settings > OAuth > New Application. Register your application with a name and redirect URI. After you register, make sure to record the UID and Secret codes provided here for future use.  For the time being applications are only available to their registered nation.

2. Ask a nation's administrator for access

    Bring the admin to this page to request access to his nation's data:

    Note: You can receive an access token to make requests on behalf of a person with permission level 'staffer', but that access token will not allow you to use the endpoints currently documented.  In the future endpoints may be individually segregated into permission level necessary.

    ```
    https://{slug}.nationbuilder.com/oauth/authorize?response_type=code&client_id=...&redirect_uri=...
    ```

    Where the client_id and redirect_uri are the values from your application's registration, and {slug} is the nation's slug

    The user will be shown a form stating that your application has requested access to their nation.

3. Record the code that comes back

    If the admin accepts your request, we will redirect him/her to your redirect_uri with a code parameter in its query string, so a request will come through like this:

    ```
    GET http://www.myapp.com/oauth_callback?code=...
    ```

    Record this code for the next step

4. Exchange the code for an access token

    Exchange that code for an access token by issuing a request for one like this:

    ```
    POST https://foobar.nationbuilder.com/oauth/token
      client_id=...
      redirect_uri=...
      grant_type=authorization_code
      client_secret=...
      code=...
    ```

    A practical example is using the command line utility cURL like this:

    ```bash
    curl -X POST --header "Content-Type: application/json" --header "Accept: application/json" --data '{"grant_type":"authorization_code", "code":"{code}", "client_id":"{client_id}", "client_secret":"{client_secret}", "redirect_uri":"{redirect_uri}"}' https://foobar.nationbuilder.com/oauth/token
    ```

    This request will receive a response like this:

    ```json
    {
      "access_token": "a44bdfe7972f7a83f5dc485cd3a7c7d2d09b0c60828ed24657c0b61e186ed93a",
      "token_type": "bearer",
      "expires_in": 7200,
      "refresh_token": "ea1d2e5dff2ab9977c4f8b41881b35ba613b644862a0101b244729359245c387",
      "scope":""
    }
    ```
        Record the access token and refresh token from the response you receive to this request

5. Use the access token to get data

    With this access token you can make requests on the user's behalf. See our API endpoint documentation for full details, but as an example, this is the request you would use to get the first page of people in a nation:

    ```
    GET https://foobar.nationbuilder.com/api/v1/people?access_token=...
    ```

    Note that the API speaks only in javascript object notation (JSON), and that 406 response code means that you need to include the Content-Type and Accept headers of your request to "application/json".

6. Refresh access token as needed

    Your access token is transient, with a time to live given in the response to your access token exchange request as "expires_in".  When the access token expires, resource requests on the nation's behalf will be denied with HTTP code 403.  To continue accessing the resources, you need to exchange the previously provided refresh token for a new access token.
    You can accomplish this by issuing this request:

    ```
    POST https://foobar.nationbuilder.com/oauth/token
      client_id=...
      redirect_uri=...
      grant_type=refresh_token
      client_secret=...
      refresh_token=...
    ```

Please direct API-related questions to byron@nationbuilder.com
