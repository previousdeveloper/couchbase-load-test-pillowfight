FROM centos:7
ENV PARAMS=""

RUN yum update -y && \
    yum install -y epel-release && \
    yum groupinstall -y development

RUN yum install -y wget

RUN wget http://packages.couchbase.com/releases/couchbase-release/couchbase-release-1.0-6-x86_64.rpm; \
    rpm -iv couchbase-release-1.0-6-x86_64.rpm; \
    yum install -y \
        libcouchbase-devel \
        gcc \
        gcc-c++ \
        libcouchbase2-bin

ENTRYPOINT cbc-pillowfight -U ${PARAMS}
