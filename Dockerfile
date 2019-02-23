FROM fractos/elasticsearch-bifrost:5.5.0

RUN echo "y" | elasticsearch-plugin install repository-s3
