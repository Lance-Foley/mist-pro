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
class ChangeOrder < ApplicationRecord
  belongs_to :project
  has_many :jobs, as: :jobable
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :change_orders, partial: "change_orders/index", locals: {change_order: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :change_orders, target: dom_id(self, :index) }
end
