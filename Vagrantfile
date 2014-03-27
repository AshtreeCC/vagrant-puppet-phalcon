# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64-parallels"
  config.vm.box_url = "https://s3-eu-west-1.amazonaws.com/vagrant-parallels/devbox-201312.box"

  config.vm.network "private_network", ip: "192.168.56.150"
  config.vm.usable_port_range = (2200..2250)

  config.vm.synced_folder "./www/", "/var/www", id: "vagrant-root",
    :owner => "vagrant",
    :group => "www-data",
    :mount_options => ["dmode=775,fmode=664"],
    :nfs => false

  config.vm.provider :parallels do |parallels|
    parallels.customize ["set", :id, "--name", "Phalcon.Dev (LNMP)"]
    parallels.customize ["set", :id, "--memsize", 512]
    parallels.customize ["set", :id, "--cpus", 1]
  end

  config.vm.provision :puppet, :module_path => "puppet/modules" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "main.pp"
    puppet.options = "--verbose"
  end
end
