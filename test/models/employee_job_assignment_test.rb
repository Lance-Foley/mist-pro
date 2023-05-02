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
require "test_helper"

class EmployeeJobAssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
