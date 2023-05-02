class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :workable_hours
      t.boolean :active
      t.decimal :wage
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
