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
require "test_helper"

class TempEmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
