class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :bid_hours
      t.integer :actual_hours
      t.date :start_date
      t.date :end_date
      t.string :cost_code
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
