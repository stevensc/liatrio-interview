FROM alpine
RUN apk update && apk upgrade
RUN mkdir -p /opt/java/current
RUN wget https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.7%2B7/OpenJDK17U-jre_x64_alpine-linux_hotspot_17.0.7_7.tar.gz -O jre.tgz
RUN tar -zxf jre.tgz -C /opt/java/current --strip-components 1
ENV JAVA_HOME=/opt/java/current
ENV PATH=$PATH:$JAVA_HOME/bin

# Clean up
RUN rm -f OpenJDK*

# App ininitalization
COPY api/target/api-my-app.jar /home/api.jar
CMD ["java","-jar","/home/api.jar"]