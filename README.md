## Entity Identity Exchange System (EIES)

#### Overview

EIES is a public key exchange service for data security around common
networking protocols, like HTTP. This server is simply a centralized key
exchange and registration service.

**Ruby Version:** 2.2.1  
**Database:** PostGreSQL

#### API
###### Sessions
Creating a session
  ```
  POST https://eies.herokuapp.com/api/v1/login?email=MY_EMAIL&password=MY_PASSWORD
  ```
Destroying a session
  ```
  DELETE https://eies.herokuapp.com/api/v1/login
  ```

###### Users
Retreive all of the current user's information
  ```
  GET https://eies.herokuapp.com/api/v1/users/USER_ID?session_id=SESSION_ID
  ```

###### Keys
Query for a public key
  ```
  GET https://eies.herokuapp.com/api/v1/public_keys?domain=DOMAIN&port=PORT
  ```
Create a new key
  ```
  POST https://eies.herokuapp.com/api/v1/keys?session_id=SESSION_ID&name=NAME&body=BODY
  ```
Retreive a key
  ```
  GET https://eies.herokuapp.com/api/v1/keys/KEY_ID?session_id=SESSION_ID
  ```
Update a key
  ```
  PUT https://eies.herokuapp.com/api/v1/keys?session_id=SESSION_ID&name=NAME&body=BODY
  ```
Destroy a key
  ```
  DELETE https://eies.herokuapp.com/api/v1/keys/KEY_ID?session_id=SESSION_ID
  ```

###### Entities
Create a new entity
  ```
  POST https://eies.herokuapp.com/api/v1/entities?session_id=SESSION_ID&name=NAME&domain=DOMAIN&port=PORT
  ```
Retreive an entity
  ```
  GET https://eies.herokuapp.com/api/v1/entities/ENTITY_ID?session_id=SESSION_ID
  ```
Update an entity
  ```
  PUT https://eies.herokuapp.com/api/v1/entities?session_id=SESSION_ID&name=NAME&domain=DOMAIN&port=PORT
  ```
Destroy an entity
  ```
  DELETE https://eies.herokuapp.com/api/v1/entities/ENTITY_ID?session_id=SESSION_ID
  ```

###### Entity_Tokens
Create a new entity token
  ```
  POST https://eies.herokuapp.com/api/v1/entity_tokens?session_id=SESSION_ID&entity_id=ENTITY_ID&key_id=KEY_ID
  ```
Retreive an entity token
  ```
  GET https://eies.herokuapp.com/api/v1/entity_tokens/ENTITY_TOKEN_ID?session_id=SESSION_ID
  ```
Destroy an entity token
  ```
  DELETE https://eies.herokuapp.com/api/v1/entity_tokens/ENTITY_TOKEN_ID?session_id=SESSION_ID
  ```
