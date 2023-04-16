class CreateAiModels < ActiveRecord::Migration[7.0]
  def change
    create_table :ai_models do |t|
      t.references :user, null: false, foreign_key: true
      t.string :description
      t.string :name
      t.float :score

      t.timestamps
    end
  end
end
