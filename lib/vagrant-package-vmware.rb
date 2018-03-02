begin
  require 'vagrant'
rescue LoadError
  raise 'The vagrant-package-vmware plugin must be run within Vagrant.'
end

require 'vagrant-package-vmware/plugin'
