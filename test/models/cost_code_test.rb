# == Schema Information
#
# Table name: cost_codes
#
#  id         :bigint           not null, primary key
#  code       :string
#  id_number  :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class CostCodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
