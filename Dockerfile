FROM ansible/centos7-ansible

#This is a variable to catch up the playbook to run (which is passed as a param for the docker build)
ARG PLAYBOOK

#We install openssh-server, just in case of ;-)
RUN yum -y install openssh-server

#We mount the ansible playbook from resources to the container (within /tmp)
COPY ./resources /tmp
WORKDIR /tmp/ansible

#To be able to launch a playbook locally we need to update the /etc/ansible/hosts
RUN rm -f /etc/ansible/hosts
RUN echo localhost ansible_connection=local > /etc/ansible/hosts

#We finally launch the playbook
RUN ansible-playbook $PLAYBOOK -vvv

ENTRYPOINT /bin/bash