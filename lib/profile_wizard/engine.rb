require_relative './models'

module ProfileWizard
  class Engine < ::Rails::Engine
    isolate_namespace ProfileWizard

    config.to_prepare do
      ActiveRecord::Base.extend ProfileWizard::Models
    end
  end
end
