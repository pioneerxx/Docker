## Simple Docker

## Part 1. Готовый докер

1. Взять официальный докер образ с nginx и выкачать его при помощи docker pull

![linux](screenshots/01.png)

2. Проверить наличие докер образа через docker images

![linux](screenshots/02.png)

3. Запустить докер образ через docker run -d [image_id|repository]

![linux](screenshots/03.png)

4. Проверить, что образ запустился через docker ps

![linux](screenshots/04.png)

5. Посмотреть информацию о контейнере через docker inspect [container_id|container_name]

![linux](screenshots/05.png)

6. По выводу команды определить и поместить в отчёт размер контейнера, список замапленных портов и ip контейнера

Размер:

![linux](screenshots/06.png)

Список замапленных портов:

![linux](screenshots/07.png)

Ip контейнера:

![linux](screenshots/08.png)

7. Остановить докер образ через docker stop [container_id|container_name]

8. Проверить, что образ остановился через docker ps

![linux](screenshots/09.png)

9. Запустить докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду run

![linux](screenshots/10.png)

10. Проверить, что в браузере по адресу localhost:80 доступна стартовая страница nginx

![linux](screenshots/11.png)

11. Проверить любым способом, что контейнер запустился

![linux](screenshots/12.png)

## Part 2. Операции с контейнером

1. Прочитать конфигурационный файл nginx.conf внутри докер контейнера через команду exec

![linux](screenshots/13.png)

2. Создать на локальной машине файл nginx.conf

3. Настроить в нем по пути /status отдачу страницы статуса сервера nginx

![linux](screenshots/14.png)

4. Скопировать созданный файл nginx.conf внутрь докер образа через команду docker cp

![linux](screenshots/15.png)

5. Перезапустить nginx внутри докер образа через команду exec

![linux](screenshots/16.png)

6. Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx

![linux](screenshots/17.png)

7. Экспортировать контейнер в файл container.tar через команду export

![linux](screenshots/18.png)

8. Остановить контейнер

![linux](screenshots/19.png)

9. Удалить образ через docker rmi [image_id|repository], не удаляя перед этим контейнеры

![linux](screenshots/20.png)

10. Удалить остановленный контейнер

![linux](screenshots/21.png)

11. Импортировать контейнер обратно через команду import

![linux](screenshots/22.png)

12. Запустить импортированный контейнер

![linux](screenshots/23.png)

13. Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx

![linux](screenshots/24.png)

## Part 3. Мини веб-сервер

1. Написать мини сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью Hello World!

![linux](screenshots/25.png)

2. Написать свой nginx.conf, который будет проксировать все запросы с 81 порта на 127.0.0.1:8080

![linux](screenshots/26.png)

3. Скопировали созданный nginx.conf и мини сервер в контейнер и зашли в него

![linux](screenshots/28.png)

4. Установили требуемые ПО

![linux](screenshots/29.png)

5. Скомпилировали и запустили написанный мини сервер через spawn-fcgi на порту 8080

![linux](screenshots/30.png)

6. Проверили, что в браузере по localhost:81 отдается написанная вами страничка

![linux](screenshots/27.png)

## Part 4. Свой докер

1. Написать свой докер образ, который:
1) собирает исходники мини сервера на FastCgi из Части 3
2) запускает его на 8080 порту
3) копирует внутрь образа написанный ./nginx/nginx.conf
4) запускает nginx.

![linux](screenshots/31.png)

![linux](screenshots/32.png)

2. Собрать написанный докер образ через docker build при этом указав имя и тег

![linux](screenshots/33.png)

3. Проверить через docker images, что все собралось корректно

![linux](screenshots/34.png)

4. Запустить собранный докер образ с маппингом 81 порта на 80 на локальной машине и маппингом папки ./nginx внутрь контейнера по адресу, где лежат конфигурационные файлы nginx'а 

![linux](screenshots/35.png)

5. Проверить, что по localhost:80 доступна страничка написанного мини сервера

![linux](screenshots/36.png)

6. Дописать в ./nginx/nginx.conf проксирование странички /status, по которой надо отдавать статус сервера nginx

![linux](screenshots/37.png)

7. Перезапустить докер образ

![linux](screenshots/38.png)

7. Проверить, что теперь по localhost:80/status отдается страничка со статусом nginx

![linux](screenshots/39.png)

## Part 5. Dockle

1. Просканировать образ из предыдущего задания через dockle [image_id|repository]

![linux](screenshots/40.png)

2. Исправить образ так, чтобы при проверке через dockle не было ошибок и предупреждений

![linux](screenshots/41.png)

## Part 6. Базовый Docker Compose

1. Написать файл docker-compose.yml, с помощью которого:

1) Поднять докер контейнер из Части 5 (он должен работать в локальной сети, т.е. не нужно использовать инструкцию EXPOSE и мапить порты на локальную машину)
2) Поднять докер контейнер с nginx, который будет проксировать все запросы с 8080 порта на 81 порт первого контейнера
2. Замапить 8080 порт второго контейнера на 80 порт локальной машины

![linux](screenshots/42.png)

![linux](screenshots/43.png)

3. Остановить все запущенные контейнеры

![linux](screenshots/44.png)

4. Собрать и запустить проект с помощью команд docker-compose build и docker-compose up

![linux](screenshots/45.png)

![linux](screenshots/46.png)

5. Проверить, что в браузере по localhost:80 отдается написанная вами страничка, как и ранее

![linux](screenshots/47.png)