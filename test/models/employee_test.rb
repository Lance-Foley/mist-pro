# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  first_name :string
#  hire_date  :date
#  hours      :decimal(, )
#  last_name  :string
#  status     :string
#  wage       :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  crew_id    :bigint           not null
#
# Indexes
#
#  index_employees_on_crew_id  (crew_id)
#
# Foreign Keys
#
#  fk_rails_...  (crew_id => crews.id)
#
require "test_helper"

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
