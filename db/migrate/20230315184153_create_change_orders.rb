class CreateChangeOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :change_orders do |t|
      t.string :name
      t.decimal :cost
      t.decimal :amount_down
      t.decimal :amount_with_held
      t.date :start_date
      t.date :end_date
      t.date :amount_down_date
      t.date :amount_with_held_date
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
