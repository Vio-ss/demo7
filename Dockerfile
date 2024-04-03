From openjdk:8
COPY . /src/java
WORKDIR /src/java
RUN ["javac", "hello.java"]
ENTRYPOINT ["java", "hello"]