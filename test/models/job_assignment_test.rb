# == Schema Information
#
# Table name: job_assignments
#
#  id                  :bigint           not null, primary key
#  employee_start_date :date
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  crew_id             :bigint           not null
#  employee_id         :bigint           not null
#  job_id              :bigint           not null
#
# Indexes
#
#  index_job_assignments_on_crew_id      (crew_id)
#  index_job_assignments_on_employee_id  (employee_id)
#  index_job_assignments_on_job_id       (job_id)
#
# Foreign Keys
#
#  fk_rails_...  (crew_id => crews.id)
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (job_id => jobs.id)
#
require "test_helper"

class JobAssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
