# == Schema Information
#
# Table name: change_orders
#
#  id                    :bigint           not null, primary key
#  amount_down           :decimal(, )
#  amount_down_date      :date
#  amount_with_held      :decimal(, )
#  amount_with_held_date :date
#  cost                  :decimal(, )
#  end_date              :date
#  name                  :string
#  start_date            :date
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  project_id            :bigint           not null
#
# Indexes
#
#  index_change_orders_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
require "test_helper"

class ChangeOrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
