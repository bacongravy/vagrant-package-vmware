require 'vagrant/action/builder'
require 'vagrant/action'
require 'vagrant/action/general/package_setup_files'
require 'vagrant/action/general/package_setup_folders'

module VagrantPlugins
  module PackageVMware
    module Action

      include Vagrant::Action::Builtin
      include Vagrant::Action::General

      def self.action_package_vmware
        require_relative 'action/halt_machine'
        require_relative 'action/package_machine'
        require_relative 'action/package_metadata'
        require_relative 'action/package_vagrantfile'
        
        Vagrant::Action::Builder.new.tap do |b|
          b.use HaltMachine
          b.use SyncedFolderCleanup
          b.use PackageSetupFolders
          b.use PackageSetupFiles
          b.use Package
          b.use PackageVagrantfile
          b.use PackageMetadata
          b.use PackageMachine
        end
      end

    end
  end
end
