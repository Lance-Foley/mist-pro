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
require "test_helper"

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
