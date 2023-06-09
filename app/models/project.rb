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
class Project < ApplicationRecord
  acts_as_tenant :account
  has_many :change_orders
  has_many :jobs
  belongs_to :client

  validates_presence_of :client, :name, :start_date, :end_date
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to(:projects, partial: 'projects/index', locals: { project: self }) }
  after_update_commit -> { broadcast_replace_later_to(self) }
  after_destroy_commit -> { broadcast_remove_to(:projects, target: dom_id(self, :index)) }

  def self.ransackable_attributes(_auth_object = nil)
    %w[
      account_id
      amount_down
      amount_down_date
      amount_with_held
      amount_with_held_date
      category
      client_id
      contact_info
      cost
      created_at
      end_date
      id
      name
      start_date
      status
      updated_at
    ]
  end
end
