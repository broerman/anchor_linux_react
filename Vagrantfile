Vagrant.configure("2") do |config|

  config.vm.box = "generic/debian9"


  config.vm.provision "packages", type: "shell" , path: "provision/packages.sh"
  config.vm.provision "file", source: "provision/anchor_notify.sh", destination: "~/anchor_notify.sh"
  config.vm.provision "file", source: "provision/anchor_reaction.sh", destination: "~/anchor_reaction.sh"
  config.vm.provision "file", source: "provision/incron_root", destination: "~/incron_root"
  config.vm.provision "finish", type: "shell" , path: "provision/finish.sh"
end
