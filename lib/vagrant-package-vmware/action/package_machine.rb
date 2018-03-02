require 'vagrant/util/subprocess'

module VagrantPlugins
  module PackageVMware
    module Action
      class PackageMachine

        def initialize(app, env)
          @app = app
        end

        def call(env)
          require_relative '../errors'

          package_machine = env[:machine]
          package_output = env['package.output']
          package_directory = env['package.directory']

          output_name = File.basename(package_output, '.box')
          input_vmx = package_machine.provider.driver.vmx_path.to_s
          output_vmx = "#{package_directory}/#{output_name}.vmx"

          env[:ui].info "Cloning machine..."
          result = Vagrant::Util::Subprocess.execute("vmrun", "clone", input_vmx, output_vmx, "full", "-cloneName=#{output_name}")

          raise Errors::CloneFailed, result: result if result.exit_code != 0

          @app.call(env)
        end

      end
    end
  end
end
