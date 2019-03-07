module ProfileWizard::Models
  class Question
    attr_accessor :answer

    def initialize(question_key, question_schema, step)
      @step = step
      @meta_info = {}
      @meta_info[:title] = question_schema[:title] || ActiveSupport::Inflector.humanize(question_key).titleize
      @meta_info[:required] = question_schema[:required].nil? ? step.required? : question_schema[:required]
    end

    def title
      @meta_info[:title]
    end

    def required?
      @meta_info[:required]
    end
  end
end