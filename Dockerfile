FROM ubuntu:20.04
EXPOSE 8000
WORKDIR /root/cookbooks

RUN apt-get update && apt-get install -y curl wget git 
RUN curl https://raw.githubusercontent.com/coder/code-server/main/install.sh | bash
RUN curl -o /tmp/chef.deb https://packages.chef.io/files/stable/chef-workstation/21.10.640/ubuntu/20.04/chef-workstation_21.10.640-1_amd64.deb && dpkg -i /tmp/chef.deb && rm -f /tmp/chef.deb
RUN git config --global user.email 'you@example.com' && git config --global user.name 'Your Name'

CMD "code-server --bind-addr 0.0.0.0:8000 --auth none"
