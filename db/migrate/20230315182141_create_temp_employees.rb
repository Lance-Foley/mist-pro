class CreateTempEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :temp_employees do |t|
      t.date :start_date
      t.date :end_date
      t.decimal :override_hours
      t.string :override_type
      t.references :temp_crew, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
