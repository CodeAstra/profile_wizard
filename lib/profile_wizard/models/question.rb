module ProfileWizard::Models
  class Question
    attr_accessor :answer

    def initialize(question_key, question_schema, step)
      @step = step
      @meta_info = {}
      @meta_info[:title] = question_schema[:title] || ActiveSupport::Inflector.humanize(question_key).titleize
      @meta_info[:mandatory] = question_schema[:mandatory].nil? ? step.mandatory? : question_schema[:mandatory]
    end

    def title
      @meta_info[:title]
    end

    def mandatory?
      @meta_info[:mandatory]
    end
  end
end