FROM klakegg/hugo:alpine AS build

WORKDIR /build

COPY . .
RUN hugo -D

FROM nginx:stable-alpine
COPY --from=build /build/public /usr/share/nginx/html

WORKDIR /usr/share/nginx/html

