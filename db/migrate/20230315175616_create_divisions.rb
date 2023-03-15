class CreateDivisions < ActiveRecord::Migration[7.0]
  def change
    create_table :divisions do |t|
      t.string :name
      t.decimal :utlization_rate
      t.decimal :overtime_rate
      t.decimal :overtime_after

      t.timestamps
    end
  end
end
