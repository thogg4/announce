# -*- mode: ruby -*-

#CLOUD_CONFIG_PATH = File.join(File.dirname(__FILE__), "vagrant/user-data")
$update_channel = "alpha"

Vagrant.configure('2') do |config|
  config.vm.box = "coreos-%s" % $update_channel
  config.vm.box_version = ">= 509.1.0"
  config.vm.box_url = "http://%s.release.core-os.net/amd64-usr/current/coreos_production_vagrant.json" % $update_channel
  config.vm.hostname = 'coreos'

  config.vm.provider :virtualbox do |v|
    v.check_guest_additions = false
    v.functional_vboxsf     = false
  end

  # apps and services network stuff
  config.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true

  # docker network stuff
  config.vm.network "forwarded_port", guest: 5555, host: 5555, auto_correct: true
  config.vm.network "private_network", ip: '55.55.55.55'

  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.memory = 1024
    vb.cpus = 1
  end

  config.vm.synced_folder ".", "/app", id: "core", :nfs => true, :mount_options => ['nolock,vers=3,udp']

  config.vm.provision 'ansible' do |ansible|
    ansible.limit = 'all'
    ansible.inventory_path = 'provisioning/vagrant-inventory'
    ansible.playbook = 'provisioning/vagrant-playbook.yml'
  end

end
