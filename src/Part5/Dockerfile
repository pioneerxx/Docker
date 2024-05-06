FROM nginx
COPY ./server.c /home/
COPY ./run.sh /home/
RUN apt-get update && apt-get install gcc spawn-fcgi libfcgi-dev -y; \
    rm -rf /var/lib/apt/lists \
    chown nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid;
USER nginx
COPY ./nginx.conf /etc/nginx/nginx.conf
WORKDIR /home
ENTRYPOINT ["sh", "./run.sh"]
HEALTHCHECK NONE
