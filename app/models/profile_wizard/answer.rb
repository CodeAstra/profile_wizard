module ProfileWizard
  class Answer < ApplicationRecord
    belongs_to :record, polymorphic: true, touch: true
  end
end
