# == Schema Information
#
# Table name: employees
#
#  id             :bigint           not null, primary key
#  active         :boolean
#  email          :string
#  name           :string
#  phone_number   :string
#  wage           :decimal(, )
#  workable_hours :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Employee < ApplicationRecord
  has_many :employee_job_assignments
  has_many :job_assignments, through: :employee_job_assignments
  has_many :jobs, through: :job_assignments
  has_one :crew_member
  has_one :crew, through: :crew_member
  # Broadcast changes in realtime with Hotwire
  after_create_commit(
    -> { broadcast_prepend_later_to(:employees, partial: "employees/index", locals: {employee: self}) }
  )
  after_update_commit -> { broadcast_replace_later_to(self) }
  after_destroy_commit -> { broadcast_remove_to(:employees, target: dom_id(self, :index)) }

  def assigned_hours(start_date, end_date)
    total_assigned_hours = 0

    # Loop through each job assignment for the employee
    job_assignments.each do |job_assignment|
      job = job_assignment.job

      # Check if the job overlaps with the given time period
      next unless job.start_date <= end_date && job.end_date >= start_date

      # Calculate the overlapping days between the job and the given time period
      overlap_start = [job.start_date, start_date].max
      overlap_end = [job.end_date, end_date].min
      overlapping_days = (overlap_end - overlap_start).to_i + 1

      # Calculate the assigned hours for the overlapping period and add it to the total
      assigned_hours = (overlapping_days.to_f / (job.end_date - job.start_date + 1).to_i) * job.actual_hours
      total_assigned_hours += assigned_hours
    end

    total_assigned_hours
  end
end
