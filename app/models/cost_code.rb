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
class CostCode < ApplicationRecord
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :cost_codes, partial: "cost_codes/index", locals: {cost_code: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :cost_codes, target: dom_id(self, :index) }
end
