Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"	 
  end
  
  config.vm.provision "shell", path: "provision.sh"
  
  config.vm.synced_folder "./", "/vagrant", disabled: true
  config.vm.synced_folder "./client", "/vagrant", :mount_options => ["dmode=777", "fmode=666"]

end
