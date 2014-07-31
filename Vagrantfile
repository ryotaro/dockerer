# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65-x86_64"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
  config.vm.synced_folder "../", "/home/vagrant/develop"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # Install Chef via Omnibus installer.
  config.vm.provision "shell", path: "https://www.opscode.com/chef/install.sh"

  # Provision with chef_solo.
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "./bootstrap-cookbooks"
    chef.add_recipe "bootstrap"
    chef.json = {}
  end
end
