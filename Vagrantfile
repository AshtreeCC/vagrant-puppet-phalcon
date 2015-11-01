# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "parallels/ubuntu-12.04"

  config.vm.network "private_network", ip: "192.168.56.170"
  config.vm.usable_port_range = (2200..2250)

  config.vm.synced_folder "./www/", "/var/www", id: "vagrant-root",
    # :owner => "vagrant",
    # :group => "www-data",
    # :mount_options => ["dmode=777,fmode=766"],
    :nfs => true

  config.vm.provider :parallels do |parallels|
    parallels.customize ["set", :id, "--name", "Phalcon.Dev"]
    parallels.customize ["set", :id, "--memsize", 512]
    parallels.customize ["set", :id, "--cpus", 1]
  end

  config.vm.provision :puppet, :module_path => "puppet/modules" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "main.pp"
    puppet.options = ["--verbose"]
  end

  config.ssh.username      = "vagrant"
  config.ssh.shell         = "bash -l"
  config.ssh.keep_alive    = true
  config.ssh.forward_agent = false
  config.ssh.forward_x11   = false

  config.vagrant.host = :detect
end
