# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.hostname = "apt-prime"
  config.vm.box = 'ceph/ubuntu-xenial' # supported on libvirt (backhoe, ionkvm1)
  config.vm.network :public_network,
                    :network_name => 'default',
                    :dev => 'bridge0',
                    :type => 'bridge',
                    :mode => 'bridge',
                    :model_type => 'virtio'
  config.vm.provision :shell, run: 'always', path: 'default-gw.sh'
  config.vm.synced_folder '.', '/vagrant', type: 'rsync'

  config.vm.provider :libvirt do |kvm|
    kvm.memory = '1024'
    kvm.cpus = '1'
    kvm.storage_pool_name = 'vm_images'
    kvm.nic_model_type = 'virtio'
    kvm.storage :file, :size => '1234G'
  end
  config.vm.provision :ansible_local do |ansible|
    ansible.playbook = 'cron-playbook.yml'
  end
  config.vm.provision :ansible_local do |ansible|
    ansible.playbook = 'filesystem-playbook.yml'
  end
  config.vm.provision :ansible_local do |ansible|
    ansible.playbook = 'apache-playbook.yml'
  end
  config.vm.provision :shell, inline: <<-SHELL
    echo 'OMG, yay!'
  SHELL
end
