require_relative './models/profile'
require_relative './models/step'
require_relative './models/question'

module ProfileWizard
  module Models
    def profile_wizard(profile_attr, profile_schema, opts = {})
      define_method(profile_attr) do
        @profile_attr ||= ProfileWizard::Models::Profile.new profile_schema
      end
    end
  end
end
