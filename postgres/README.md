# Postgres

Postgres базу данных лучше всего разворачивать один раз и больше не трогать, для того чтобы не терять собранные данные.

### Direct deploy

На машину на которой развернут Postgres необходимо положить файл образ базы данных. Положите файл postgres_dump.sql в директорию DUMP_PATH

После выполните следующую команду:

```
psql -U postgres postgres < DUMP_PATH/postgres_dump.sql
```

### Docker deploy

В случае сборки через Docker, соберите изображение используя Dockerfile. 

Откройте терминал в директории проекта

```
docker build -t scannon-postgres:latest .
```



После развертывания контейнера, пропишите в терминале команду: 

```
psql -U postgres postgres < /init_data/postgres_dump.sql
```
