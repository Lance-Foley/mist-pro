# == Schema Information
#
# Table name: job_assignments
#
#  id                  :bigint           not null, primary key
#  employee_start_date :date
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  crew_id             :bigint           not null
#  job_id              :bigint           not null
#
# Indexes
#
#  index_job_assignments_on_crew_id  (crew_id)
#  index_job_assignments_on_job_id   (job_id)
#
# Foreign Keys
#
#  fk_rails_...  (crew_id => crews.id)
#  fk_rails_...  (job_id => jobs.id)
#
class JobAssignment < ApplicationRecord
  belongs_to :job
  belongs_to :crew
  has_many :employee_job_assignments
  has_many :employees, through: :employee_job_assignments
  # Broadcast changes in realtime with Hotwire
  after_create_commit(
    lambda {
      broadcast_prepend_later_to(
        :job_assignments,
        partial: 'job_assignments/index',
        locals: { job_assignment: self }
      )
    }
  )
  after_update_commit -> { broadcast_replace_later_to(self) }
  after_destroy_commit -> { broadcast_remove_to(:job_assignments, target: dom_id(self, :index)) }
  def total_hours_worked
    employee_job_assignments.map(&:hours_worked).sum
  end

  def hours_remaining
    bid_hours - total_hours_worked
  end
end
