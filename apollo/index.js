const { Neo4jGraphQL } = require('@neo4j/graphql')
const { Neo4jGraphQLAuthJWKSPlugin } = require('@neo4j/graphql-plugin-auth')
const { GraphQLJSON, GraphQLJSONObject } = require('graphql-type-json')
const { ApolloServer, gql } = require('apollo-server')
const neo4j = require('neo4j-driver')
const fs = require('fs')
const dotenv = require('dotenv')
const path = require('path')
const https = require('https')

dotenv.config()

const CLIENT_ID = process.env.ORCID_CLIENT_ID
const CLIENT_SECRET = process.env.ORCID_CLIENT_SECRET
const REDIRECT_URI = process.env.ORCID_REDIRECT_URI

const typeDefs = gql(
    fs.readFileSync(path.join(__dirname, 'schema.graphql')).toString('utf-8')
)

const driver = neo4j.driver(
    process.env.NEO4J_URI || 'bolt://localhost:7687',
    neo4j.auth.basic(
        process.env.NEO4J_USER || 'neo4j',
        process.env.NEO4J_PASSWORD || 'test'
    )
)

const resolvers = {
    Query: {
        getJWT: (parent, args, context, info) => {
            var postData = new URLSearchParams({
                client_id: CLIENT_ID,
                client_secret: CLIENT_SECRET,
                redirect_uri: REDIRECT_URI,
                grant_type: 'authorization_code',
                code: args.code,
            }).toString()

            console.log(postData.toString())

            var options = {
                method: 'POST',
                hostname: 'orcid.org',
                path: '/oauth/token',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                    Accept: 'application/json',
                    'Content-Length': postData.toString().length,
                },
            }

            return new Promise((resolve, reject) => {
                var req = https.request(options, function (res) {
                    let data = ''
                    res.on('data', function (chunk) {
                        data += chunk
                    })
                    res.on('end', function () {
                        resolve(JSON.parse(data))
                    })
                })

                req.on('error', function (e) {
                    reject(e)
                })

                req.write(postData)
                req.end()
            })
        },
    },
}

const neoSchema = new Neo4jGraphQL({
    typeDefs,
    resolvers: resolvers,
    plugins: {
        auth: new Neo4jGraphQLAuthJWKSPlugin({
            jwksEndpoint: 'https://orcid.org/oauth/jwks',
        }),
    },
})

neoSchema.getSchema().then((schema) => {
    const server = new ApolloServer({
        schema,
        context: ({ req }) => {
            return {
                driver,
                req,
            }
        },
        resolvers,
        introspection: true,
        playground: true,
    })

    server.listen().then(({ url }) => {
        console.log(`GraphQL server ready at ${url}`)
    })
})
