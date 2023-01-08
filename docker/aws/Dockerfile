from cnboonhan/dev

RUN DEBIAN_FRONTEND=noninteractive apt install awscli -y
RUN python3 -m pip install localstack awscli-local boto3 cfn-lint
RUN bash -c ". /root/.asdf/asdf.sh && npm install -g serverless"
RUN echo "complete -C '/usr/bin/aws_completer' aws" >> /root/.zshrc
RUN echo "complete -C '/usr/bin/aws_completer' awslocal" >> /root/.zshrc
RUN echo "export AWS_DEFAULT_REGION='ap-southeast-1'" >> /root/.zshrc

RUN mkdir -p /root/.aws
COPY credentials /root/.aws/credentials
COPY config /root/.aws/config

RUN mkdir -p /root/.vim
COPY coc-settings.json /root/.vim/coc-settings.json

RUN curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "/tmp/session-manager-plugin.deb"
RUN cd /tmp && dpkg -i session-manager-plugin.deb

RUN curl -L "https://github.com/lucagrulla/cw/releases/download/v4.1.1/cw_amd64.deb" -o "/tmp/cw.deb"
RUN cd /tmp && dpkg -i cw.deb

run curl "https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip" -o "/tmp/terraform.zip"
RUn cd /tmp && unzip terraform.zip && mv terraform /usr/local/bin

RUN curl "https://releases.hashicorp.com/terraform-ls/0.30.1/terraform-ls_0.30.1_linux_amd64.zip" -o "/tmp/terraform-ls.zip"
RUN cd /tmp && unzip terraform-ls.zip && mv terraform-ls /usr/local/bin
