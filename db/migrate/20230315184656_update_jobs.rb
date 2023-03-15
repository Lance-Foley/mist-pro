class UpdateJobs < ActiveRecord::Migration[7.0]
  def change
    # Add the polymorphic references
    add_reference :jobs, :jobable, polymorphic: true, null: false, index: true
  end
end
