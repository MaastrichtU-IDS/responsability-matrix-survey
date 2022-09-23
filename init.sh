#!/bin/bash

# Script to initialize the neo4j database with some questions

# ./init.sh https://api.responsability-matrix.137.120.31.102.nip.io/graphql


if [ -z "$1" ]
then
  GRAPHQL_URL="http://localhost:4000/graphql"
else
  GRAPHQL_URL=$1
fi

# script=$(cat apollo/feed.gql)

script=$(sed 's/"/\\"/g' apollo/feed.gql)

script="$(echo $script)"   # the query should be a one-liner, without newlines

echo $script


curl -i -H 'Content-Type: application/json' -X POST -d "{ \"query\": \"$script\"}" $GRAPHQL_URL

