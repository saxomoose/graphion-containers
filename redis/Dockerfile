FROM redis:latest

COPY users.acl /usr/local/etc/redis/users.acl
COPY redis.conf /usr/local/etc/redis/redis.conf

CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]