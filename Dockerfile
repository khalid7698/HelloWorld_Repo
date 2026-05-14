FROM eclipse-temurin:21

WORKDIR /app

COPY . .

RUN javac HelloWorld.java

CMD ["java", "HelloWorld"]
