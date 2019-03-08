module ProfileWizard::Models
  class Step
    attr_accessor :questions,
                  :profile_wizard_step_title,
                  :profile_wizard_step_required

    def initialize(step_key, step_schema, answer_hsh)
      @questions = {}
      @meta_info = {}
      @meta_info[:title] = step_schema[:title] || ActiveSupport::Inflector.humanize(step_key).titleize
      @meta_info[:required] = step_schema[:required] || false
      step_ref = self
      step_schema[:questions].each do |question_key, question_schema|
        self.class.class_eval do
          define_method(question_key) do
            @questions[question_key] ||= ProfileWizard::Models::Question.new(question_key, question_schema, step_ref, answer_hsh[step_key.to_s])
          end

          define_method("#{question_key}=") do |val|
            @questions[question_key].answer = val
          end
        end
        send(question_key)
      end
    end

    # We are making an assumption that there won't be a question with the key `:title`
    def title
      @meta_info[:title]
    end

    def required?
      @meta_info[:required]
    end
  end
end
