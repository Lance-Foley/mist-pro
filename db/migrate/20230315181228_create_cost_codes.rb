class CreateCostCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :cost_codes do |t|
      t.string :name
      t.string :code
      t.string :id_number

      t.timestamps
    end
  end
end
