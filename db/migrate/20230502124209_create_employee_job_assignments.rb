class CreateEmployeeJobAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_job_assignments do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :job_assignment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
