class AddDatesToEmployeeJobAssignments < ActiveRecord::Migration[7.0]
  def change
    add_column :employee_job_assignments, :start_date, :date
    add_column :employee_job_assignments, :end_date, :date
  end
end
