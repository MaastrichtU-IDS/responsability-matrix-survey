#!/bin/bash

# Script to initialize the neo4j database with some questions

# GRAPHQL_URL="https://api.responsability-matrix.137.120.31.148.nip.io/graphql"
GRAPHQL_URL="http://localhost:4000/graphql"

script=$(cat apollo/feed.gql)

# script=$(sed 's/"/\\"/g' apollo/feed.gql)

echo $script


curl -i -H 'Content-Type: application/json' -X POST -d "{ \"query\": \"$script\"}" $GRAPHQL_URL


# curl -i -H 'Content-Type: application/json' \
#    -H "Authorization: bearer ........." \
#    -X POST -d "{ \"query\": \"$script\"}" $GRAPHQL_URL