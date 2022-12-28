# Sring Backend

Backend также можно развернуть двумя способами. Через docker или напрямую на сервере.

### Config

Перед сборкой бэкэнда необходимо настроить config файл conf.json
Укажите ip, port, login, password для подключения к Postgres базе данных.

### Direct deploy

Для начала необходимо собрать Maven проект. Это можно сделать через IDEA - maven package или командой:

```
mvn clear
```


```
mvn package
```

Результат будет находиться в папке target. Переносим файл: as-ScannonSpring.jar на машину с которой будет запускаться бэкэнд, в папку BACKEND_PATH и вводим команду:

```
java -jar BACKEND_PATH/as-ScannonSpring.jar
```

### Docker deploy

```
docker build -t scannon-backend:latest .
```

### Дополнительно
Стоит отметить что в случае деплоя через Docker, необходимо правильно забиндить порты контейнеров при запуске и правильно настроить конфиг бэкэнда 