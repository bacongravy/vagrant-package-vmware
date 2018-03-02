module VagrantPlugins
  module PackageVMware
    class Plugin < Vagrant.plugin("2")
      name "package-vmware command"
      description <<-DESC
      The `package-vmware` command will take a previously existing Vagrant
      environment and package it into a box file.
      DESC

      command("package-vmware") do
        require_relative 'command'
        Command
      end
    end
  end
end
