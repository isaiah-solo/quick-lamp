Vagrant.configure("2") do |config|
  config.vm.define "master" do |master|
    master.vm.box = "debian/jessie64"
    master.vm.provision :shell, path: "provision_scripts/setup_puppet.sh"
    master.vm.provision :puppet do |puppet|
      puppet.synced_folder_type = "rsync"
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "site.pp"
    end
    master.vm.provision :shell, path: "provision_scripts/setup_web_root.sh"
    master.vm.network :forwarded_port, guest: 80, host: 8080
  end
end
