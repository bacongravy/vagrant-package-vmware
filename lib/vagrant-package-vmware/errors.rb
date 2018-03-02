require 'vagrant/errors'

module VagrantPlugins
  module PackageVMware
    module Errors
      class CloneFailed < Vagrant::Errors::VagrantError
        def error_message
          "Clone failed: #{(@extra_data[:result].stdout + @extra_data[:result].stderr).chomp}"
        end
      end
    end
  end
end
