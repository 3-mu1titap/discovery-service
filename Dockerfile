# Docker 이미지를 빌드하기 위한 기본 이미지를 설정
FROM openjdk:17-jdk-slim

# 컨테이너 내에서 애플리케이션이 실행될 위치
# 컨테이너 내부의 루트 디렉토리에서의 /app을 지정
WORKDIR /app

# 호스트 시스템의 파일을 컨테이너 이미지로 복사
COPY build/libs/discovery-0.0.1-SNAPSHOT.jar discovery-service.jar

# 컨테이너가 시작될 때 /app/app.jar 파일을 실행, -Xms512m, -Xmx512m은 JVM의 최소 및 최대 힙(메모리) 크기를 512MB로 설정
ENTRYPOINT ["java", "-Xms512m", "-Xmx512m", "-jar", "discovery-service.jar"]

# Eureka 서버의 기본 포트
EXPOSE 8761

# 타인존 시간대를 한국 시간대로 설정
ENV TZ=Asia/Seoul