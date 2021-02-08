FROM amazon/aws-cli

ENV TERRAFORM=0.14.6

RUN yum update && \
  yum -y install unzip git && \
  curl -L https://releases.hashicorp.com/terraform/${TERRAFORM}/terraform_${TERRAFORM}_linux_amd64.zip > tf.zip && \
  unzip tf.zip && \
  chmod +x terraform && mv terraform /usr/bin/terraform && rm tf.zip
