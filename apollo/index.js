const { Neo4jGraphQL } = require("@neo4j/graphql");
const { Neo4jGraphQLAuthJWKSPlugin } = require("@neo4j/graphql-plugin-auth");
const { ApolloServer, gql } = require("apollo-server");
const neo4j = require("neo4j-driver");
const fs = require("fs");
const dotenv = require("dotenv");
const path = require("path");

dotenv.config();

const typeDefs = gql(fs.readFileSync(path.join(__dirname, "schema.graphql")).toString("utf-8"));


const driver = neo4j.driver(
    process.env.NEO4J_URI || "bolt://localhost:7687",
    neo4j.auth.basic(process.env.NEO4J_USER || "neo4j", process.env.NEO4J_PASSWORD || "test")
);

const neoSchema = new Neo4jGraphQL({
    typeDefs,
    plugins: {
        auth: new Neo4jGraphQLAuthJWKSPlugin({
            jwksEndpoint: "https://www.googleapis.com/service_accounts/v1/jwk/securetoken@system.gserviceaccount.com",
        })
    }
});

neoSchema.getSchema().then((schema) => {
    const server = new ApolloServer({
        schema,
        context: ({ req }) => {
            return {
                driver,
                req,
            };
        },
        introspection: true,
        playground: true,
    });

    server.listen().then(({ url }) => {
        console.log(`GraphQL server ready at ${url}`);
    });
});
