class CreateProfileWizardAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_wizard_answers do |t|
      t.string :name, null: false
      t.json :data
      t.references :record, null: false, polymorphic: true, index: false

      t.timestamps

      t.index [ :record_type, :record_id, :name ], name: "index_profile_wizard_answers_uniqueness", unique: true
    end
  end
end
