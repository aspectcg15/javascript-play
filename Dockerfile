#Base Image as CentOS

FROM centos:latest

MAINTAINER morgan.commons@aspect.com

RUN yum -y update
RUN yum install -y git ack-grep vim curl wget tmux build-essential python-software-properties nano
# Install Java 1.8

RUN yum -y install wget git unzip pwgen ca-certificates java-1.8.0-openjdk java-1.8.0-openjdk-devel

# Install Typesafe activator for Play applications
RUN wget http://downloads.typesafe.com/typesafe-activator/1.3.4/typesafe-activator-1.3.4.zip
RUN unzip typesafe-activator-1.3.4.zip

#Install SBT
RUN curl https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo
RUN yum -y install sbt

ENV PATH /activator-1.3.4:$PATH

#ADD JAVA-PLAY-APP TO CONTAINER
ADD home/omniusr/play-java-hello-world /play-java-hello-world

ENV PROJECT_WORKPLACE /play-java-hello-world/

EXPOSE 9000

WORKDIR /play-java-hello-world

#ADD STARTUP SCRIPT

#ADD startScript.sh /play-java-hello-world/startScript.sh

#ENTRYPOINT sh startScript.sh


