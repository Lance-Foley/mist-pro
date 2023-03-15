# == Schema Information
#
# Table name: temp_employees
#
#  id             :bigint           not null, primary key
#  end_date       :date
#  override_hours :decimal(, )
#  override_type  :string
#  start_date     :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  employee_id    :bigint           not null
#  job_id         :bigint           not null
#  temp_crew_id   :bigint           not null
#
# Indexes
#
#  index_temp_employees_on_employee_id   (employee_id)
#  index_temp_employees_on_job_id        (job_id)
#  index_temp_employees_on_temp_crew_id  (temp_crew_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (job_id => jobs.id)
#  fk_rails_...  (temp_crew_id => temp_crews.id)
#
class TempEmployee < ApplicationRecord
  belongs_to :temp_crew
  belongs_to :employee
  belongs_to :job
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :temp_employees, partial: "temp_employees/index", locals: {temp_employee: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :temp_employees, target: dom_id(self, :index) }

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date
  validates :override_hours, presence: true

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def adjusted_hours
    case override_type
    when "override"
      override_hours
    when "subtract"
      employee.hours - override_hours
    when "append"
      employee.hours + override_hours
    else
      employee.hours
    end
  end
end
