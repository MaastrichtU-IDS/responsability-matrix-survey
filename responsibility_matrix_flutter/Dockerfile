# Flutter Web Dockerfile
FROM cirrusci/flutter:3.7.5 AS build-env

ARG GRAPHQL_URL
ARG AUTH_URL

RUN mkdir /app

COPY . /app

WORKDIR /app


RUN flutter clean

RUN flutter pub get

# Generate auto-generated files
RUN flutter pub run build_runner build --delete-conflicting-outputs

RUN flutter build web --dart-define GRAPHQL_URL=$GRAPHQL_URL --dart-define AUTH_URL=$AUTH_URL


FROM nginx:1.21.1-alpine AS serve-env

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build-env /app/build/web /usr/share/nginx/html