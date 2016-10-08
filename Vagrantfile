# -*- mode: ruby -*-
# vi: set ft=ruby :

# this setup requires vagrant-hostmanager plugin
# vagrant plugin install vagrant-hostmanager
# vagrant plugin list

require 'yaml'
#$env = YAML::load_file("#{ENV['PWD']}/vagrant.yml")
$env = YAML::load_file("vagrant.yml")

Vagrant.configure('2') do |config|

    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true

    $env['hosts'].each do |host_name, host_config|
        config.vm.define host_name do |host|
            host.vm.box = 'ubuntu'
            host.vm.synced_folder '.', '/vagrant', :disabled => true
            host.vm.network 'private_network', ip: host_config['eth1']
            host.vm.hostname = host_name

            if host_config['ports']
                host_config['ports'].each do |port|
                    host.vm.network 'forwarded_port', :guest => port['guest'], :host => port['host']
                end
            end

            host.vm.provider :virtualbox do |vbox|
                if host_config['memory']
                    vbox.memory = host_config['memory']
                end
            end

            host.vm.provider :virtualbox do |vbox|
                if host_config['cpus']
                    vbox.cpus = host_config['cpus']
                end
            end

            if host_name.include? "jenkins"
              host.vm.provision "shell", path: "install_oracle_jdk_8.sh"
              host.vm.provision "shell", path: "provision-jenkins-master.sh"
            elsif host_name.include? "slave"
              host.vm.provision "shell", path: "install_oracle_jdk_8.sh"
              host.vm.provision "shell", path: "provision-jenkins-slave.sh"
            else
              host.vm.provision "shell", path: "install_tomcat.sh"
            end

        end
    end
end
