module VagrantPlugins
  module PackageVMware
    class Command < Vagrant.plugin(2, :command)
      def self.synopsis
        "packages a running VMware vagrant environment into a box"
      end

      def execute
        options = {}
        options[:tty] = true

        opts = OptionParser.new do |o|
          o.banner = "Usage: vagrant package-vmware [options] [name]"
          o.separator ""
          o.separator "Options:"
          o.separator ""

          o.on("--output NAME", "Name of the file to output") do |output|
            options[:output] = output
          end

          o.on("--include FILE,FILE..", Array, "Comma separated additional files to package with the box") do |i|
            options[:include] = i
          end

          o.on("--vagrantfile FILE", "Vagrantfile to package with the box") do |v|
            options[:vagrantfile] = v
          end
        end

        # Parse the options
        argv = parse_options(opts)
        return if !argv

        @logger.debug("package options: #{options.inspect}")

        package_target(argv[0], options)

        # Success, exit status 0
        0
      end

      def package_target(name, options)
        with_target_vms(name, single_target: true) do |vm|
          @logger.debug("Packaging VM: #{vm.name}")
          package_vm(vm, options)
        end
      end

      def package_vm(vm, options)
        require_relative 'action'

        opts = options.inject({}) do |acc, data|
          k,v = data
          acc["package.#{k}"] = v
          acc
        end
        opts[:machine] = vm

        @env.action_runner.run(VagrantPlugins::PackageVMware::Action.action_package_vmware, opts)
      end

    end
  end
end
