Surveys API
===========

Use the Survey Pages API to interface with surveys stored in NationBuilder

Index Endpoint
--------------
Retrieve a paginated list of existing surveys

`GET /api/v1/sites/:site_slug/pages/surveys`

### Parameters

* `page` - The page number, defaults to 0
* `per_page` - Number of entries to display, defaults to 10

### Example

```
GET https://foobar.nationbuilder.com/api/v1/sites/foobar/pages/surveys?page=1&per_page=2
```

You will receive a response with status 200 and this data:

```json
{
  "page": 1,
  "total_pages": 1,
  "per_page": 2,
  "total": 1,
  "data": [
    {
      "id": 1,
      "slug": "survey",
      "site_slug": "foobar",
      "name": "Survey",
      "questions": [
        {
          "id": 1,
          "prompt": "What issue is more important to you?",
          "slug": "important_issue",
          "type": "multiple",
          "status": "published",
          "choices": [
            {
              "id": 2,
              "name": "Daily mail service to all homes. Yeah right....",
              "feedback": "really now...?"
            },
            {
              "id": 3,
              "name": "Opposition to any change in our naturalization laws",
              "feedback": null
            },
            {
              "id": 9,
              "name": "foobar",
              "feedback": "foobar"
            },
            {
              "id": 1,
              "name": "Kansas should be admitted as a state",
              "feedback": null
            }
          ]
        },
        {
          "id": 4,
          "prompt": "Do you support high speed trains to the sea?",
          "slug": "trains2",
          "type": "multiple",
          "status": "published",
          "choices": [
            {
              "id": 10,
              "name": "Yes, it is urgently needed.",
              "feedback": null
            },
            {
              "id": 11,
              "name": "Maybe, if it doesn't cost an arm and a leg.",
              "feedback": null
            },
            {
              "id": 12,
              "name": "No, I never even go to the sea.",
              "feedback": null
            }
          ]
        }
      ],
      "status": "published"
    }
  ]
}
```

Create Endpoint
---------------

Creates a survey page with the attributes and questions provided.

`POST /api/v1/sites/:site_slug/pages/surveys`

### Example

```
POST https://foobar.nationbuilder.com/api/v1/sites/foobar/pages/surveys
```

### Request Body

```json
{
  "survey": {
    "slug": "survey",
    "name": "Survey",
    "questions": [{
      "prompt": "What issue is more important to you?",
      "slug": "important_issue",
      "type": "multiple",
      "status": "published",
      "choices": [{
        "name": "Daily mail service to all homes. Yeah right....",
        "feedback": "really now...?"
      }, {
        "name": "Opposition to any change in our naturalization laws",
        "feedback": null
      }, {
        "name": "foobar",
        "feedback": "foobar"
      }, {
        "name": "Kansas should be admitted as a state",
        "feedback": null
      }]
    }]
  }
}
```

Notes:
* a survey can have a list of questions, and each question can have the following types: `multiple`, `yes_no`, `text`.
* Questions of type `multiple` can have a list of choices shown in the example above. `yes_no` and `text` questions does not contain choices.
* Questions and choice ordering will match the request's ordering

You will receive a response of status code 200 and a body like this:

```json
{
  "survey": {
    "id": 5,
    "slug": "survey",
    "status": "drafted",
    "site_slug": "foobar",
    "name": "Survey",
    "headline": null,
    "title": null,
    "excerpt": null,
    "author_id": null,
    "external_id": null,
    "questions": [
      {
        "id": 9,
        "prompt": "What issue is more important to you?",
        "slug": "important_issue",
        "type": "multiple",
        "status": "published",
        "choices": [
          {
            "id": 3,
            "name": "Daily mail service to all homes. Yeah right....",
            "feedback": "really now...?"
          },
          {
            "id": 4,
            "name": "Opposition to any change in our naturalization laws",
            "feedback": null
          },
          {
            "id": 5,
            "name": "foobar",
            "feedback": "foobar"
          },
          {
            "id": 6,
            "name": "Kansas should be admitted as a state",
            "feedback": null
          }
        ]
      }
    ]
  }
}
```

Update Endpoint
---------------

`PUT /api/v1/sites/foobar/pages/surveys/:id`

### Example

```
PUT https://foobar.nationbuilder.com/api/v1/sites/foobar/pages/surveys/5
```

### Request Body

```json
{
  "survey": {
    "slug": "survey",
    "site_slug": "foobar",
    "name": "Survey",
    "questions": [{
      "prompt": "Are you a political junkie?",
      "type": "yes_no",
      "slug": "politics_junk",
      "status": "published"
    }, {
      "id": 9,
      "prompt": "What issue is more important to you?",
      "slug": "important_issue",
      "type": "multiple",
      "status": "published",
      "choices": [{
        "id": 3,
        "name": "Daily mail service to all homes. Yeah right....",
        "feedback": "really now...?"
      }, {
        "id": 4,
        "name": "Opposition to any change in our naturalization laws",
        "feedback": null
      }, {
        "id": 6,
        "name": "Kansas should be admitted as a state",
        "feedback": null
      }]
    }]
  }
}
```

Note: When updating a survey, Nested resources such as questions and choices are updated, created, or deleted according to the following rules:

* Existing nested resources not mentioned in the response body will be deleted.
* Nested resource is updated if an `id` attribute is supplied and the nested resource is found in your nation's database.
* If a nested resource has an `id` attribute specified but is not found in your nation's database, the API call will fail and respond with status code 404.
* The nested resource is created if no `id` attribute is supplied.


You will get a response with code 200 like this:

```json
{
  "survey": {
    "id": 5,
    "slug": "survey",
    "status": "drafted",
    "site_slug": "foobar",
    "name": "Survey",
    "headline": null,
    "title": null,
    "excerpt": null,
    "author_id": null,
    "external_id": null,
    "questions": [
      {
        "id": 10,
        "prompt": "Are you a political junkie?",
        "slug": "politics_junk",
        "type": "yes_no",
        "status": "published",
        "choices": [

        ]
      },
      {
        "id": 9,
        "prompt": "What issue is more important to you?",
        "slug": "important_issue",
        "type": "multiple",
        "status": "published",
        "choices": [
          {
            "id": 3,
            "name": "Daily mail service to all homes. Yeah right....",
            "feedback": "really now...?"
          },
          {
            "id": 4,
            "name": "Opposition to any change in our naturalization laws",
            "feedback": null
          },
          {
            "id": 6,
            "name": "Kansas should be admitted as a state",
            "feedback": null
          }
        ]
      }
    ]
  }
}
```

Destroy Endpoint
----------------

Destroy the survey provided.  This does not destroy the associated questions.
`DELETE /api/v1/survey/:id`

Survey Response Creation Endpoint
=================================

Use this endpoint to register the responses a person has to a survey.  The answers will be attached to their profile page.

Note: Answering questions requires the surveyed person to have a first name and last name recorded.  If the person record does not have this information attached, a validation error will be returned from this call.

POST /api/v1/survey_responses


### Parameters

#### Survey Response Parameters
* survey_id - id of the survey the person answered
* person_id - id of the person who answered the survey
* surveyor_id - id of the person who took the answers
* question_responses - an array of objects representing the responses to individual questions that the surveyed person provided

#### Question Response Parameters
* question_id - id of the question being answered
* response - the response provided to the question. Response can be a string or id.  If the survey question being responded to is a multiple choice question, the response will be the choice with the id provided.  If the question is a yes/no question, then the response can be either "yes" or "no".  If the question is a text question, the response will be stored as the provided string.

### Example

```
POST https://foobar.nationbuilder.com/api/v1/survey_responses
```

```
{
  "survey_response": {
    "survey_id": 1,
    "person_id": 19,
    "surveyor_id": 19247,
    question_responses: [{
      "question_id": 12093814098,
      "response": 3
    }, {
      "question_id": 12093814099,
      "response": "No way man, that isn't cool"
    }, {
      "question_id": 12093814100,
      "response": "yes"
    }]
  }
}
```

The survey response will be made, and you should receive a response with status 200 and body like this:

```
{
  "survey_response": {
    "id": 3014",
    "survey_id": 1,
    "person_id": 19,
    "surveyor_id": 19247,
    question_responses: [{
      "id": 12497,
      "question_id": 12093814098,
      "response": 3
    }, {
      "id": 12498,
      "question_id": 12093814099,
      "response": "No way man, that isn't cool"
    }, {
      "id": 12499,
      "question_id": 12093814100,
      "response": "yes"
    }]
  }
}
```

