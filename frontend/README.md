# Scannon Frontend

Scannon Frontend - основной код приложения. Он самодостаточен и может работать без остальных сервисов. При этом без бэкэнда и базы данных функциональность сбора метрик и авторизации работать не будет.

### Direct deploy
Просто перенесите содержимое папки frontend в папку вашего веб сервера. Например в случае если вы используете NGINX, стандартным путем является: 

```
/var/www/html/Scannon
```

После этого игру можно запустить из браузера по адресу:

```
http://<your_server_ip>/Scannon/index.html
```

### Docker deploy

```
docker build -t scannon-frontend:latest .
```