# == Schema Information
#
# Table name: projects
#
#  id                    :bigint           not null, primary key
#  amount_down           :decimal(, )
#  amount_down_date      :date
#  amount_with_held      :decimal(, )
#  amount_with_held_date :date
#  category              :string
#  contact_info          :text
#  cost                  :decimal(, )
#  end_date              :date
#  name                  :string
#  start_date            :date
#  status                :boolean
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  account_id            :integer
#  client_id             :bigint           not null
#
# Indexes
#
#  index_projects_on_account_id  (account_id)
#  index_projects_on_client_id   (client_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#
require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
