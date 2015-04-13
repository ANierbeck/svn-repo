FROM ubuntu:14.04
MAINTAINER anierbeck

VOLUME /data
EXPOSE 3690

RUN apt-get update && apt-get install subversion -y
RUN mkdir -p /var/svn/repo/test-repo
RUN mkdir -p /var/svn/repo/mvnbook-example
RUN mkdir -p /var/svn/repo/conf
RUN svnadmin create /var/svn/repo/test-repo
RUN svnadmin create /var/svn/repo/mvnbook-example

COPY conf/* /var/svn/repo/test-repo/conf/
COPY conf/* /var/svn/repo/mvnbook-example/conf/

CMD ["svnserve", "--foreground", "-d", "-r", "/var/svn/repo"]
