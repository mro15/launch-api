# Coodesh Ruby on Rails Back-End Challenge

This is a challenge to test the Back-End skills using Ruby on Rails.

Challenge reference: [Back-End Challenge 20210221](https://lab.coodesh.com/marcelaribeirooliveira/challenge-20210221)

## Description of the challenge

The objective of the challent is to develop a REST API for the FutureSpace Inc company following the requirements proposed.

### Requirements

- Develop a routine to import  data from Project: [https://ll.thespacedevs.com/2.0.0/launch/](https://ll.thespacedevs.com/2.0.0/launch/)
- Develop a REST API with a CRUD

#### Models

The models must accomplish the  Launch fields. Moreover, other two fields are required:

- `imported_t`: Date field containing the day and hour of the importation;
-  `status`: Enum field with the values: draft, trash and published;

#### CRON job

Create a Cron job to run the rotine to import data from SpaceDevs API.

#### REST API

The REST API must have the following endpoints:
-   `GET /`: Returns the message "REST Back-end Challenge 20201209 Running"
-   `PUT /launchers/:launchId`: Responsible to update a specific launch (`launchId`)
-   `DELETE /launchers/:launchId`: Remove a launch (`launchId`) from the database
-   `GET /launchers/:launchId`: Get the launch (`launchId`) information
-   `GET /launchers`: List all launchers using pagination.


#### Extras

**Differential 3** Write a security scheme using `API KEY` in the endpoints. [Reference](https://learning.postman.com/docs/sending-requests/authorization/#api-key)

## Project installation

Assuming that you already have ruby installed, if not consult the [guide](https://rvm.io/rvm/install), the next step is to configure the database.

### Postgres database configuration

- Create the user `launch_app` with `createdb` permission.
- Set the `LAUNCH_APP_DATABASE_PASSWORD` environment variable with the `launch_app` user password.

The database credentials are used in the `config/database.yml` file.


### Install the Gems

The required gems are listed in the `Gemfile` file. To install them, run the command:


```sh
    bundle install
```

### Database creation

Run the command below to create the database:

```sh
    rails db:create
```

Then, run the following command to create the database tables and relations:

```sh
    rails db:migrate
```

## Populating the database

There is a rake task - `lib/tasks/launch_import.rake` - to populate the database. Run the command below to execute this task.

```sh
    rake launch:import_launchs
```

## Generating the API keys

To access any endpoint of the API, you will need a valid API key. To generate a set of 10 API keys and store them in the database (they are consulted by the application controllers), run the `lib/tasks/api_key.rake` task, using the following command:

```sh
    rake api_key:generate
```

## Running the API

To run the API, run the rails server:

```sh
    rails s
```

### Accessing the API endpoints

First of all, you will need a valid API key, so consult the `api_keys` table and get one key to use in the `X-API-KEY` header.

#### Example requests

- GET `/`
	```sh
	curl --location --request GET 'localhost:3000' \
	--header 'X-API-KEY: API-KEY-VALUE'
	```
- GET `/launchers`
	- Without pagination params (returns 25 results)
		```sh
		curl --location --request GET 'localhost:3000/launchers' \
		--header 'X-API-KEY: API-KEY-VALUE'
		```
	- With pagination params: 
		```sh
		curl --location --request GET 'localhost:3000/launchers?page=1&per_page=10' \
		--header 'X-API-KEY: API-KEY-VALUE'
		```
- GET `/launchers/:launchId`
	```sh
	curl --location --request GET 'localhost:3000/launchers/e3df2ecd-c239-472f-95e4-2b89b4f75800' \
	--header 'X-API-KEY: API-KEY-VALUE'
	```
- PUT `/launchers/:launchId`
	```sh
	curl --location --request PUT 'localhost:3000/launchers/e3df2ecd-c239-472f-95e4-2b89b4f75800' \
	--header 'X-API-KEY: API-KEY-VALUE' \
	--header 'Content-Type: application/json' \
	--data-raw '{
	    "launch": {
	        "name": "another launch",
	        "status": 1,
	        "program": "example program",
	        "mission": {
	            "name": "example mission"
	        },
	        "pad": {
	            "info_url": "https://ll.thespacedevs.com/2.0.0/launch/"
	        }
	    }
	}'
	```
- DELETE `/launchers/:launchId`
	```sh
	curl --location --request DELETE 'localhost:3000/launchers/48bc7deb-b2e1-46c2-ab63-0ce00fbd192b' \
	--header 'X-API-KEY: cgStXg_eIHszJ3j4VjqkCLqrVp6kZH4xUgZ5pH5nJSM'
	```
