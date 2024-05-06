FROM nginx
RUN apt-get update && apt-get install gcc spawn-fcgi libfcgi-dev -y

WORKDIR /home/
COPY ./server.c .
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./run.sh .
ENTRYPOINT ["sh", "./run.sh"]