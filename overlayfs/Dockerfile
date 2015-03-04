FROM eavatar/builder

# Install RabbitMQ.
RUN wget -qO - https://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add -
RUN echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list
RUN  apt-get update
RUN  DEBIAN_FRONTEND=noninteractive apt-get install -y rabbitmq-server
RUN  rabbitmq-plugins enable rabbitmq_management && \
     echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config

RUN mkdir -p /dist
WORKDIR /dist
RUN mkdir -p data lib usr/sbin usr/bin usr/lib/erlang usr/lib/rabbitmq var/log/rabbitmq var/log/erlang var/lib/rabbitmq  etc/rabbitmq
RUN cp -r /etc/rabbitmq/* etc/rabbitmq/

RUN cp /usr/sbin/rabbitmq-server usr/sbin/ &&\
    cp /usr/sbin/rabbitmqctl usr/sbin/ &&\
    cp /usr/sbin/rabbitmq-plugins usr/sbin/ &&\
    cp /usr/bin/start_embedded usr/bin &&\
    cp /usr/bin/erlc usr/bin &&\
    cp /usr/bin/epmd usr/bin &&\
    cp /usr/bin/to_erl usr/bin &&\
    cp /usr/bin/erl_call usr/bin &&\
    cp /usr/bin/run_erl usr/bin &&\
    cp /usr/bin/erl usr/bin


RUN  cp -a /usr/lib/rabbitmq usr/lib/ &&\
     cp -a /usr/lib/erlang usr/lib/ &&\
     cp -a /var/lib/rabbitmq var/lib/

RUN \
     cp /lib/x86_64-linux-gnu/libselinux.so.1 lib/ &&\
     cp /lib/x86_64-linux-gnu/libutil.so.1 lib/ &&\
     cp /lib/x86_64-linux-gnu/libpcre.so.3 lib/ &&\
     cp /lib/x86_64-linux-gnu/libpam.so.0 lib/ &&\
     cp /lib/x86_64-linux-gnu/libaudit.so.1 lib/ &&\
     cp /lib/x86_64-linux-gnu/libz.so.1 lib/ &&\
     cp /lib/x86_64-linux-gnu/libcrypt.so.1 lib/ &&\
     cp /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 lib/ &&\
     cp /lib/x86_64-linux-gnu/libssl.so.1.0.0 lib/ &&\
     cp /lib/x86_64-linux-gnu/libexpat.so.1 lib/

RUN tar cf /overlayfs.tar .