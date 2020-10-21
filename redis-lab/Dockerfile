FROM redis
RUN useradd -m -p redis -s /bin/bash redis_admin
USER redis_admin
WORKDIR /usr/local/etc/redis/
COPY --chown=redis_admin redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]

