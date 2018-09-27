FROM kilna/liquibase-mysql
ENV LIQUIBASE_HOST=db
ENV LIQUIBASE_DATABASE=adventureworks
ENV LIQUIBASE_USERNAME=advuser
ENV LIQUIBASE_PASSWORD=password
ENV LIQUIBASE_URL="jdbc:mysql://db:3306/adventureworks?allowPublicKeyRetrieval=true&useSSL=false"
COPY data/ /workspace/data
COPY schema.sql /workspace
COPY changelog.xml /workspace
