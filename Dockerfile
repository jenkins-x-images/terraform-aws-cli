FROM amazon/aws-cli

ENV TERRAFORM=0.14.6

RUN curl -L https://releases.hashicorp.com/terraform/${TERRAFORM}/terraform_${TERRAFORM}_linux_amd64.zip > tf.zip  && \
  unzip tf.zip && rm tf.zip && \
  chmod +x terraform && mv terraform /usr/bin/terraform && rm terraform_${TERRAFORM}_linux_amd64.zip
