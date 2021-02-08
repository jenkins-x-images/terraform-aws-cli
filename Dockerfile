FROM golang:1.15

ENV TERRAFORM=0.14.6

RUN apt-get update -y && apt-get install -y unzip

RUN curl -L https://releases.hashicorp.com/terraform/${TERRAFORM}/terraform_${TERRAFORM}_linux_amd64.zip > tf.zip && \
  unzip tf.zip && \
  chmod +x terraform && mv terraform /usr/bin/terraform && rm tf.zip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip > /dev/null && \
  ./aws/install

RUN curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.15.10/2020-02-22/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x aws-iam-authenticator && \
    mv aws-iam-authenticator /usr/bin/aws-iam-authenticator

