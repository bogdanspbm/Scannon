#
# Postgres stage
#
FROM postgres AS runtime_init
ENV POSTGRES_DB postgres
ENV POSTGRES_PASSWORD=postgrespw

ADD postgres_dump.sql /docker-entrypoint-initdb.d


FROM runtime_init AS buildtime_init_builder
RUN echo "exit 0" > /docker-entrypoint-initdb.d/100-exit_before_boot.sh
ENV PGDATA=/pgdata
RUN docker-entrypoint.sh postgres

FROM postgres AS buildtime_init
ENV PGDATA=/pgdata
COPY --chown=postgres:postgres --from=buildtime_init_builder /pgdata /pgdata

ADD  postgres_dump.sql /init_data/postgres_dump.sql

EXPOSE 5432