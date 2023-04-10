FROM ubuntu:22.04


RUN apt-get update && \
  apt-get install -y gcc python3.11 git && \
  apt-get install -y python3-pip ssh && \
  pip3 install --upgrade pip && \
  pip3 install ansible requests && \
  pip3 install ansible-pylibssh && \
  pip3 install pyats[full] && \
  pip3 install ansible-lint && \
  pip3 install virl2-client==2.4.0 && \
  ansible-galaxy collection install cisco.nxos && \
  ansible-galaxy collection install cisco.cml