class CreateTempCrews < ActiveRecord::Migration[7.0]
  def change
    create_table :temp_crews do |t|
      t.references :job, null: false, foreign_key: true
      t.references :crew, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :name

      t.timestamps
    end
  end
end
