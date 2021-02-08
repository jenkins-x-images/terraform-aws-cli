FROM amazon/aws-cli

ENV TERRAFORM=0.14.6

RUN yum update && \
  yum -y install unzip tar make git

RUN curl -L https://releases.hashicorp.com/terraform/${TERRAFORM}/terraform_${TERRAFORM}_linux_amd64.zip > tf.zip && \
  unzip tf.zip && \
  chmod +x terraform && mv terraform /usr/bin/terraform && rm tf.zip

RUN curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.15.10/2020-02-22/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x aws-iam-authenticator && \
    mv aws-iam-authenticator /usr/bin/aws-iam-authenticator

ENV GOLANG_VERSION 1.15.6
RUN curl -o go.tar.gz -L https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz && \
  tar -C /usr/local -xzf go.tar.gz && \
  rm go.tar.gz

ENV GOROOT /usr/local/go
ENV GOPATH /home/go

ENV PATH $PATH:/usr/local/go/bin:$GOPATH/bin
