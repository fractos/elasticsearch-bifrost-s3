FROM fractos/elasticsearch-bifrost:5.5.0

COPY java.policy /tmp

RUN cp -f /tmp/java.policy /etc/java-8-openjdk/security/java.policy

RUN echo "y" | elasticsearch-plugin install repository-s3
