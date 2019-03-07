module ProfileWizard::Models
  class Profile
    attr_accessor :steps

    def initialize(profile_attr, profile_schema, record)
      @steps = {}
      @profile_attr = profile_attr
      @record = record
      profile_schema.each do |step_key, step_schema|
        self.class.class_eval do
          define_method(step_key) do
            @steps[step_key] ||= ProfileWizard::Models::Step.new(step_key, step_schema)
          end
        end
        send(step_key)
      end
    end

    def save
      answer.data = json_answer_data
      answer.save if answer.data_changed?
    end

    def save!
      answer.data = json_answer_data
      answer.save! if answer.data_changed?
    end

    private

    def answer
      @answer ||= ProfileWizard::Answer.find_or_initialize_by(record: @record, name: @profile_attr)
    end

    def json_answer_data
      data = {}
      steps.each do |step_key, step|
        data[step_key] = {}
        step.questions.each do |question_key, question|
          data[step_key][question_key] = question.answer
        end
      end

      data
    end
  end
end