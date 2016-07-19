FROM docker

MAINTAINER Tomek Wałkuski <ja@jestem.tw>

WORKDIR /opt

RUN apk --update --no-cache add git openjdk8-jre ttf-dejavu \
    && wget http://mirrors.jenkins-ci.org/war/2.14/jenkins.war \
    && echo 'jenkins ALL=(ALL) NOPASSWD: /usr/local/bin/docker' >> /etc/sudoers

CMD ["java", "-jar", "/opt/jenkins.war"]
