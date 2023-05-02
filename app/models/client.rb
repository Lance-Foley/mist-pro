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
class Client < ApplicationRecord
  acts_as_tenant :account
  has_many :projects
  has_many :jobs, through: :projects
  validates_presence_of :name
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to(:clients, partial: 'clients/index', locals: { client: self }) }
  after_update_commit -> { broadcast_replace_later_to(self) }
  after_destroy_commit -> { broadcast_remove_to(:clients, target: dom_id(self, :index)) }
end
