# == Schema Information
#
# Table name: change_orders
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
class ChangeOrder < ApplicationRecord
  belongs_to :project
  has_many :jobs
  # Broadcast changes in realtime with Hotwire
  after_create_commit(
    lambda {
      broadcast_prepend_later_to(
        :change_orders,
        partial: 'change_orders/index',
        locals: { change_order: self }
      )
    }
  )
  after_update_commit -> { broadcast_replace_later_to(self) }
  after_destroy_commit -> { broadcast_remove_to(:change_orders, target: dom_id(self, :index)) }

  def self.ransackable_attributes(_auth_object = nil)
    %w[
      amount_down
      amount_down_date
      amount_with_held
      amount_with_held_date
      category
      contact_info
      cost
      created_at
      end_date
      id
      name
      project_id
      start_date
      status
      updated_at
    ]
  end
end
