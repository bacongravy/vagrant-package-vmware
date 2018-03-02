module VagrantPlugins
  module PackageVMware
    module Action
      class PackageMetadata

        def initialize(app, env)
          @app = app
        end

        def call(env)
          @env = env
          create_metadata
          @app.call(env)
        end

        def create_metadata
          File.open(File.join(@env['package.directory'], "metadata.json"), "w") do |f|
            f.write(JSON.generate({
              provider: @env[:machine].provider_name
            }))
          end
        end

      end
    end
  end
end
