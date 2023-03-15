class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.decimal :bid_hours
      t.decimal :actual_hours
      t.date :start_date
      t.date :end_date
      t.references :cost_code, null: false, foreign_key: true
      t.decimal :cost

      t.timestamps
    end
  end
end
