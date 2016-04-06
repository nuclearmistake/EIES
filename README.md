## Entity Identity Exchange System (EIES)

#### Overview

EIES is a public key exchange service for data security around common
networking protocols, like HTTP. This server is simply a centralized key
exchange and registration service.

* Ruby version
2.2.1

* Database
PostGreSQL

#### API
###### Sessions
- Creating a session
  ```POST https://eies.herokuapp.com/api/v1/login?email=MY_EMAIL&password=MY_PASSWORD```
- Destroying a session
  ```DELETE https://eies.herokuapp.com/api/v1/login```

###### Users
- Retreive all of the current user's information
  ```GET https://eies.herokuapp.com/api/v1/users/USER_ID?session_id=SESSION_ID```

###### Keys
- Query for a public key
- Create a new key
- Retreive a key
- Update a key
- Destroy a key

###### Entities
- Create a new entity
- Retreive an entity
- Update an entity
- Destroy an entity

###### Entity_Tokens
- Create a new entity token
- Retreive an entity token
- Destroy an entity token
