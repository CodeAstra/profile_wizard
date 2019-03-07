module ProfileWizard::Models
  class Profile
    attr_accessor :steps

    def initialize(profile_schema)
      @steps = {}
      profile_schema.each do |step_key, step_schema|
        self.class.class_eval do
          define_method(step_key) do
            @steps[step_key] ||= ProfileWizard::Models::Step.new(step_key, step_schema)
          end
        end
        send(step_key)
      end
    end
  end
end