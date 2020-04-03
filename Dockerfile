FROM centos:7
ENV PARAMS=""

RELASE_VERSION = "couchbase-release-1.0-6-x86_64.rpm;"

RUN yum update -y && \
    yum install -y epel-release && \
    yum groupinstall -y development

RUN yum install -y wget

RUN wget http://packages.couchbase.com/releases/couchbase-release/${RELASE_VERSION} \
    rpm -iv ${RELASE_VERSION} \
    yum install -y \
        libcouchbase-devel \
        gcc \
        gcc-c++ \
        libcouchbase2-bin

ENTRYPOINT cbc-pillowfight -U ${PARAMS}
