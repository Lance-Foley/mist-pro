# == Schema Information
#
# Table name: clients
#
#  id                       :bigint           not null, primary key
#  business_phone           :string
#  cell_phone               :string
#  email                    :string
#  name                     :string
#  secondary_business_phone :string
#  secondary_cell_phone     :string
#  secondary_email          :string
#  secondary_name           :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  account_id               :integer
#
# Indexes
#
#  index_clients_on_account_id  (account_id)
#
require "test_helper"

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
