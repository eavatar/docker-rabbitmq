#!/bin/bash

source /etc/envvars

ulimit -n 1024
chown -R rabbitmq:rabbitmq /data
exec rabbitmq-server $@