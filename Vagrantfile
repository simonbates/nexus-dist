# -*- mode: ruby -*-
# vi: set ft=ruby :

NEXUS_PORT = "9081"

Vagrant.configure("2") do |config|

  config.vm.hostname = "gpii-nexus"

  config.vm.box = "inclusivedesign/centos7"

  config.vm.network "forwarded_port", guest: "#{NEXUS_PORT}", host: "#{NEXUS_PORT}", host_ip: "127.0.0.1"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.cpus = "2"
    vb.memory = "512"
  end

  config.vm.provision "shell", inline: <<-SHELL
    yum -y install docker-latest
    systemctl stop docker
    systemctl disable docker
    systemctl enable docker-latest
    systemctl start docker-latest
    grep -qF "DOCKERBINARY" /etc/sysconfig/docker || echo "DOCKERBINARY=/usr/bin/docker-latest" >> /etc/sysconfig/docker
  SHELL

  config.vm.provision "shell", run: "always", inline: <<-SHELL
    cd /vagrant
    ./scripts/vagrant-docker.sh
  SHELL

end
