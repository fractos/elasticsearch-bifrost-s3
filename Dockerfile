FROM fractos/elasticsearch-bifrost:2.4.1

COPY java.policy /tmp

RUN cp -f /tmp/java.policy /etc/java-8-openjdk/security/java.policy

RUN echo "y" | bin/plugin install cloud-aws
