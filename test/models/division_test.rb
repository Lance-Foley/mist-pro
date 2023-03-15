# == Schema Information
#
# Table name: divisions
#
#  id              :bigint           not null, primary key
#  name            :string
#  overtime_after  :decimal(, )
#  overtime_rate   :decimal(, )
#  utlization_rate :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class DivisionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
