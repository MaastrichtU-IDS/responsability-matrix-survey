# UM Responsibility Matrix Survey

## 🧬 Purpose



## 📦️ Prerequisites
- Docker/Docker Compose
- Flutter/Dart
- firebase cli
Note: You may or may not need Node and NPM, depending on how you want to install the firebace cli

## ⚡️ Quick setup

1. Copy the firebase authentication file in `mobile_client_new/lib` 
2. Define a `.env` file with `NEO4J_PASSWORD=test` (you can change the password of course)
3. Start the stack on localhost (website) and localhost:4000 (graphql API) with docker-compose:

```bash
docker-compose up
```

4. After you started the system you need to feed the system with some data. Make sure the `GRAPHQL_URL` in the `init.sh` script is pointing to the GraphQL API you want to initialized, and run the script:

```bash
./init.sh
```

## 📖 Complete setup

#### Firebase

This project uses Firebase for authentication purposes. You will need to create a Firebase project from [here](https://console.firebase.google.com/). Once you have created a project, you will need to enable the authentication service and enable email/password login. Otherwise authentication will not work!

1. If you don't installed firebase cli, install it by following the instructions [here](https://firebase.google.com/docs/cli#setup_update_cli)

2. Login to firebase by running `firebase login`

3. Run `dart pub global activate flutterfire_cli` command to install the flutterfire cli

4. Navigate to the `mobile_client_new` folder and run `flutterfire configure` command to configure the firebase project

5. Follow the instructions provided by the cli to configure the firebase project and make sure you configured firebase project for web.

After the configuration is done, you should have a `firebase_options.dart` file in the `lib` folder and it should contain configration for web. If it doesn't, you can re-run the `flutterfire configure` command and select the web option.

Note: Make sure you have created a configuration for web.

#### Docker Compose

In the docker-compose file, you may need to change:

##### For neo4j

1- NEO4J_AUTH environment variable to set the password for neo4j (username/password)

Note: Neo4j docker image does not support changing inital username. So, just change the password.

2- NEO4J_dbms_memory_pagecache_size environment variable to set the page cache size for neo4j

3- NEO4J_dbms_memory_heap_max__size environment variable to set the heap size for neo4j


##### For apollo

1- NEO4J_USERNAME environment variable to set the username for neo4j

2- NEO4J_PASSWORD environment variable to set the password for neo4j

##### For flutter

1- GRAPHQL_URI environment variable to set the graphql uri

Note: Flutter web apps does not rendered on server side, so you need to set the graphql uri to the public ip of the server that you are running the docker-compose file on.


After you have configured the docker-compose file, you can run `docker-compose up` command to start the system.

#### After Docker Compose

After you started the system you need to feed the system with some data. 

