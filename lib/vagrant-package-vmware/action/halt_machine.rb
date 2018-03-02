module VagrantPlugins
  module PackageVMware
    module Action
      class HaltMachine

        def initialize(app, env)
          @app = app
        end

        def call(env)
          env[:machine].action(:halt)
          @app.call(env)
        end

      end
    end
  end
end
