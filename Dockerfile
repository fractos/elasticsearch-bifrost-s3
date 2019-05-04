FROM fractos/elasticsearch-bifrost:2.4.1

RUN echo "y" | bin/plugin install cloud-aws
