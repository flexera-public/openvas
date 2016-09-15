#!/bin/bash
echo "Updating Redis config..."
mv /etc/redis/redis.conf /etc/redis/redis.orig ;\
mv /etc/redis/redis.tmp /etc/redis/redis.conf ;\
service redis-server restart ;