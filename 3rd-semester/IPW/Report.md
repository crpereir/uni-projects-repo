# SECA - Shows & Events Chelas Application
This project consisted of developing a web application with the aim of providing specific services related to event management (user creation and addition, editing, and removal of groups and events).

In the development of this Web API, we relied on some operations performed by the TicketMaster API.

The server supports data storage either in local memory or through a document-based database (ElasticSearch).

The goal of this project was to create a functional website that incorporates techniques and processes taught in class.

## Description of the application structure
The application is separated in two big components: the server and the client.

#### SERVER
The server is responsible for implementing the functionalities of our application, such as processing HTTP requests and responses, handling errors generated by them, storing data via ElasticSearch or local memory, and interacting with the TicketMaster API.

    
#### CLIENT
The client component is responsible for all logic related to interaction with the client, such as registering or logging in a new user and creating HTML pages.

# Data Storage Design

The data storage design corresponds to the service layer and is divided into two sections: user-related data and group-related data.

## User

Each SECA user consists of:
- **id** - internal identifier provided by the server.
- **name** - registered name of a user.
- **password** - registered password of a user.
- **token** - a random UUID provided by the server.

## Group

Each SECA group consists of:
- **id** - internal identifier provided by the server.
- **name** - assigned name of a group.
- **description** - assigned description of a group.
- **events** - events of a group, each event has:
    - **eventId** - id of the event.
    - **eventName** - name of the event.
    - **eventDate** - date of the event.
    - **eventSegment** - segment of the event (May not exist).
    - **eventGenre** - genre of the event (May not exist).
- **userId** - the id of the user that owns the group.

Initially, data storage was being handled locally, using data structures that retained the data throughout the program’s execution.  This method, however, had a significant drawback: the data would be lost once the application stopped running. To overcome this limitation and improve the system’s functionality, the implementation of Elasticsearch became a must. This change enabled the persistent storage of data, shifting from a local storage approach to a server-based one, specifically using a document-oriented database for more efficient and reliable data management.

With the implementation of Elasticsearch, upon the start of our application, indices are automatically created for both users and groups (one for each). These documents are in JSON format and include properties associated with a group and a user

# Mapping between the ElasticSearch’s SECA documents and the Web Application Internal Data Structure

Although ElasticSearch gives users the ability to establish their own document identifiers, it was determined to let ElasticSearch produce them automatically for each group and user that is created, being those the indexes of this database.

It’s important to note that while our application uses JavaScript objects, ElasticSearch uses JSON. Therefore, a transformation process - serialization/deserialization - is required for data storage.

The following image shows a mapping between elastic search and our internal data structure on the left and right, respectively:
![Elastic Mapping](/docs/elastic-mapping.png)

## Server API documentation

The **SECA API** has the following routes:

- **POST** <code>/users</code> - Creates a user by providing its username and password.
- **GET** <code>/events/:eventId</code> - Gets the details of a specified event by providing it's id.
- **GET** <code>/events/search/name</code> - Searches the events with the specified name, showing a certain number of events in a certain page, both defined by the user.
- **GET** <code>/events/search/popular</code> - Searches the most popular events, showing a certain number of events in a certain page, both defined by the user.
- **GET** <code>/groups</code> - Gets all groups of a certain user
- **POST** <code>/groups</code> - Adds a new group to the list of groups of an user by providing it's name and description.
- **GET** <code>/groups/:groupId</code> - Gets the details of a specified group by providing it's id.
- **PUT** <code>/groups/:groupId</code> - Edits a new group by providing it's id and the new name and description for it.
- **DELETE** <code>/groups/:groupId</code> - Deletes a specified group by providing it's id.
- **PUT** <code>/groups/:groupId/events/:eventId</code> - Adds a new event to a specified group by providing the id's for both the group and the event.
- **DELETE** <code>/groups/:groupId/events/:eventId</code> - Deletes an event from a group by providing the id's for both the group and the event.

The official API documentation can be found in [seca_api._spec](/docs/seca_api_spec.yaml) which was the first step in the realization of this project.

## Instructions to run the application and respective tests

### Project Setup
- Use this commands before adding any files to a new project.
    - <code>npm init</code>
    - <code>npm install nodejs</code>
    - <code>npm install node-fetch</code>
    - <code>npm install express</code>
    - <code>npm install express-session</code>
    - <code>npm install cors</code>
    - <code>npm install swagger-ui-express</code>
    - <code>npm install yamljs</code>
    - <code>npm install path</code>
    - <code>npm install hbs</code>
    - <code>npm install url</code>
    - <code>npm install passport</code>
    - <code>npm install mocha</code>
    - <code>npm install chai</code>

- In the ***package.json*** file:
    - Change *scripts* key value - *test*:
        - From:
            ```json
            "scripts": {
                "test": "echo \"Error: no test specified\" && exit 1"
            }
            ```
        - To:
            ```json
            "scripts": {
                "test": "mocha"
            }
            ```
### Insert Test Data
- Using internal memory data access:
    - There's already data stored internally and can be viewed in the files:
        - [users-data-mem](/data/mem/users-data-mem.mjs)
        - [groups-data-mem](/data/mem/groups-data-mem.mjs)
- Using Elastic Search data access:
    - Run a elastic search database in the default port(9200).
    - Install extension REST Client for Visual Studio Code.
    - Go to file *initial-requests-for-elastic.http* and click on *Send Request* for the following requests:
        - **PUT** <code>http://localhost:9200/groups</code> - Creates an index in elastic search to store the groups of all users.
        - **PUT** <code>http://localhost:9200/users</code> - Creates an index in elastic search to store the users.
        - **POST** <code>http://localhost:9200/groups/_doc?refresh=wait_for</code> - Creates a document in the index groups. Sends body with the name of the group, description, events and the userId of the user that owns the group.
        - **POST** <code>http://localhost:9200/users/_doc/?refresh=wait_for</code> - Creates a document in the index users. Sends body with the username, password and token of the inserted user.

**The initialization of the elastic search database is automatically done when the server is initiallized.**

### Launch Server
- **Deployment** - <code>node seca-server.mjs</code> or <code>npm run start</code>
- **Development** - <code>nodemon seca-server.mjs</code> or <code>npm run start-dev</code> 

### Run Tests
- **Command** - <code>npm test</code>

### Authors
- **Bruno Raposo** - A50553<br>
- **Fábio Silva** - A50536<br>
- **Carolina Pereira** - A49470
---
Instituto Superior de Engenharia de Lisboa<br>
Introduction to Web Programing<br>
Winter Semester of 2023/2024