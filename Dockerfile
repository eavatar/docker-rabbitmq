FROM eavatar/basebox


ADD overlayfs.tar /
ADD rabbitmq-run.sh /etc/service/rabbitmq/run

RUN  chmod +x /etc/service/rabbitmq/run


RUN echo rabbitmq:x:102:106::/data:/bin/sh >> /etc/passwd &&\
    echo rabbitmq:x:106: >> /etc/group

# Define environment variables.
ENV RABBITMQ_LOG_BASE /data/log
ENV RABBITMQ_MNESIA_BASE /data/mnesia

# Define mount points.
VOLUME ["/data/log", "/data/mnesia"]

# Define working directory.
WORKDIR /data


# Expose ports.
EXPOSE 5672 15672 4369