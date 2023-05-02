class CreateJobAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :job_assignments do |t|
      t.references :job, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.references :crew, null: false, foreign_key: true
      t.date :employee_start_date

      t.timestamps
    end
  end
end
