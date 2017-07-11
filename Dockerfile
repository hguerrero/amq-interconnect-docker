FROM registry.access.redhat.com/rhel7-atomic
MAINTAINER Hugo Guerrero "hguerrer@redhat.com"

# Install all dependencies
RUN microdnf --enablerepo=rhel-7-server-rpms \
  --enablerepo=amq-interconnect-1-for-rhel-7-server-rpms \
  --enablerepo=a-mq-clients-1-for-rhel-7-server-rpms \
  install qpid-proton-c \
  python-qpid-proton \
  qpid-dispatch-router \
  qpid-dispatch-tools \
  --nodocs; \
  microdnf clean all

# Expose port and run
EXPOSE 5672
CMD ["/usr/sbin/qdrouterd"]
