class RemoveEmployeeIdFromJobAssignments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :job_assignments, :employee, null: false, foreign_key: true
  end
end
