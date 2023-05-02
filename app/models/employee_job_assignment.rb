# == Schema Information
#
# Table name: employee_job_assignments
#
#  id                :bigint           not null, primary key
#  end_date          :date
#  start_date        :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  employee_id       :bigint           not null
#  job_assignment_id :bigint           not null
#
# Indexes
#
#  index_employee_job_assignments_on_employee_id        (employee_id)
#  index_employee_job_assignments_on_job_assignment_id  (job_assignment_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (job_assignment_id => job_assignments.id)
#
class EmployeeJobAssignment < ApplicationRecord
  belongs_to :employee
  belongs_to :job_assignment
  # Broadcast changes in realtime with Hotwire
  after_create_commit(
    lambda {
      broadcast_prepend_later_to(
        :employee_job_assignments,
        partial: "employee_job_assignments/index",
        locals: {employee_job_assignment: self}
      )
    }
  )
  after_update_commit -> { broadcast_replace_later_to(self) }
  after_destroy_commit -> { broadcast_remove_to(:employee_job_assignments, target: dom_id(self, :index)) }

  # Calculate the hours worked by the employee for this assignment
  def hours_worked
    assignment_start_date = start_date || job_assignment.start_date
    assignment_end_date = end_date || job_assignment.end_date

    # Use the current date if the job is still ongoing
    end_date_or_now = [assignment_end_date, Date.today].min
    total_days = (end_date_or_now - assignment_start_date).to_i
    weeks = (total_days / 7.0).ceil

    # Calculate the hours worked based on the workable_hours for the employee
    hours = weeks * employee.workable_hours
  end
end
