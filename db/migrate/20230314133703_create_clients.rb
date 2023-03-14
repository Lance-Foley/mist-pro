class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :business_phone
      t.string :cell_phone
      t.string :secondary_name
      t.string :secondary_email
      t.string :secondary_business_phone
      t.string :secondary_cell_phone

      t.timestamps
    end
  end
end
