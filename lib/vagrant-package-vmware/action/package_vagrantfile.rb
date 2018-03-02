module VagrantPlugins
  module PackageVMware
    module Action
      class PackageVagrantfile

        def initialize(app, env)
          @app = app
        end

        def call(env)
          @env = env
          create_vagrantfile
          @app.call(env)
        end

        def create_vagrantfile
          File.open(File.join(@env['package.directory'], "Vagrantfile"), "w") do |f|
            f.write(<<EOF
include_vagrantfile = File.expand_path("../include/_Vagrantfile", __FILE__)
load include_vagrantfile if File.exist?(include_vagrantfile)
EOF
            )
          end
        end

      end
    end
  end
end
