class AddChangeOrderIdToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column(:jobs, :change_order_id, :bigint)
  end
end
