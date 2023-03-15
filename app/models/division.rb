# == Schema Information
#
# Table name: divisions
#
#  id              :bigint           not null, primary key
#  name            :string
#  overtime_after  :decimal(, )
#  overtime_rate   :decimal(, )
#  utlization_rate :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Division < ApplicationRecord
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :divisions, partial: "divisions/index", locals: {division: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :divisions, target: dom_id(self, :index) }
end
