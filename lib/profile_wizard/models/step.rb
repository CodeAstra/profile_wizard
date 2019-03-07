module ProfileWizard::Models
  class Step
    attr_accessor :questions,
                  :profile_wizard_step_title,
                  :profile_wizard_step_mandatory

    def initialize(step_key, step_schema)
      @questions = {}
      @meta_info = {}
      @meta_info[:title] = step_schema[:title] || ActiveSupport::Inflector.humanize(step_key).titleize
      @meta_info[:mandatory] = step_schema[:mandatory] || false
      step_ref = self
      step_schema[:questions].each do |question_key, question_schema|
        self.class.class_eval do
          define_method(question_key) do
            @questions[question_key] ||= ProfileWizard::Models::Question.new(question_key, question_schema, step_ref)
          end
        end
        send(question_key)
      end
    end

    # We are making an assumption that there won't be a question with the key `:title`
    def title
      @meta_info[:title]
    end

    def mandatory?
      @meta_info[:mandatory]
    end
  end
end
