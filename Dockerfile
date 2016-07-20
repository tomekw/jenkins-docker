FROM docker:1.11.2

MAINTAINER Tomek Wałkuski <ja@jestem.tw>

WORKDIR /opt

ENV JENKINS_HOME /var/jenkins

VOLUME /var/jenkins

RUN apk --update --no-cache add git openjdk8-jre ttf-dejavu openssh-client \
    && wget http://mirrors.jenkins-ci.org/war/2.14/jenkins.war \
    && echo 'jenkins ALL=(ALL) NOPASSWD: /usr/local/bin/docker' >> /etc/sudoers \
    && curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

CMD ["java", "-jar", "/opt/jenkins.war"]
