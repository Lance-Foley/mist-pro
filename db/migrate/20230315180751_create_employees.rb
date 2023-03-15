class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.date :hire_date
      t.decimal :wage
      t.decimal :hours
      t.string :status
      t.references :crew, null: false, foreign_key: true

      t.timestamps
    end
  end
end
