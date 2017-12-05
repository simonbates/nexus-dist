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

  config.vm.provision "shell", run: "always", inline: <<-SHELL
    cd /vagrant
    ./scripts/docker.sh
  SHELL

end
