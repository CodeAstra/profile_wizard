module ProfileWizard
  module Models
    def profile_wizard(profile_attr, profile_fields, opts = {})
      define_method(profile_attr.to_sym) do
        profile_fields
      end
    end
  end
end
