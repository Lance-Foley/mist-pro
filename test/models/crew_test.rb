# == Schema Information
#
# Table name: crews
#
#  id          :bigint           not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  division_id :bigint           not null
#  leader_id   :integer
#
# Indexes
#
#  index_crews_on_division_id  (division_id)
#
# Foreign Keys
#
#  fk_rails_...  (division_id => divisions.id)
#
require "test_helper"

class CrewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
