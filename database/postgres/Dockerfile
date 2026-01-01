FROM postgres:17-alpine

ARG PG_USER
ARG PG_PASS

ENV POSTGRES_USER=${PG_USER}
ENV POSTGRES_PASSWORD=${PG_PASS}

COPY ./init-scripts/ /docker-entrypoint-initdb.d/

EXPOSE 5432