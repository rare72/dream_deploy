# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = {
    'automated' => [1, 139],
    'dns-infra' => [1, 132],
    #'dhcp-infra' => [1, 135],
    #'other-infra' => [1, 129],
    'compute' => [2, 149],
    'M-compute' => [1, 209],
}

Vagrant.require_version ">= 1.7"
Vagrant.configure("2") do |config|
    #config.vm.box = "pv.test.6"
    config.ssh.insert_key = false
    config.ssh.private_key_path = "C:\\data_pv\\DEVELOPMENT\\test.1\\key\\vagrant_private"


    nodes.each do |prefix, (count, ip_start)|
      count.times do |i|
        hostname = "%s-%02d" % [prefix, (i+1)]
        #hostname = "%s" % [count, (i+1)]

    config.vm.define "#{hostname}" do |box|
      if hostname.include? "dns-infra"
        box.vm.box = "pv.test.7"
        elsif hostname.include? "other-infra"
          box.vm.box = "pv.test.7a"
        else
          box.vm.box = "pv.test.7b"
        end
      box.vm.hostname = "#{hostname}"
      box.vm.network "private_network", ip: "192.168.147.#{ip_start+i}", netmask: "255.255.255.0"
      box.vm.boot_timeout = 120

      # vmware_workstation provider settings
      box.vm.provider :vmware_workstation do |v|
        v.gui = true
        v.vmx["numvcpus"] = "1"
        v.vmx["ethernet0.virtualdev"] = "e1000e"
        v.vmx["ethernet1.virtualdev"] = "e1000e"
        v.vmx["memsize"] = "2048"
        if prefix == "compute"
          v.vmx["memsize"] = "256"
        elsif prefix == "M-compute"
          v.vmx["memsize"] = "512"
          v.vmx["numvcpus"] = "2"
          end
        end
      end
    end
  end
end
