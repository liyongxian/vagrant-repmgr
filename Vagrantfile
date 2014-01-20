# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|


 config.vm.define "db1" do |db1|
    db1.vm.box = "precise64"
    db1.vm.hostname="db1"
    db1.vm.network :forwarded_port, guest: 5432, host: 5431
    db1.vm.provision :shell, :path => "bootstrap.sh"
    db1.vm.network :private_network, ip: "192.164.1.121"
  end

 config.vm.define "db2" do |db2|
    db2.vm.box = "precise64"
    db2.vm.hostname="db2"
    db2.vm.network :forwarded_port, guest: 5432, host: 5432
    db2.vm.provision :shell, :path => "bootstrap.sh"
    db2.vm.network :private_network, ip: "192.164.1.122"
  end


end
