#!/bin/bash

gcc -o server.fcgi server.c -lfcgi;
spawn-fcgi -p 8080 ./server.fcgi;
nginx

while true; do sleep 1000; done