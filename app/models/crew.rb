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
class Crew < ApplicationRecord
  belongs_to :division
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :crews, partial: "crews/index", locals: {crew: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :crews, target: dom_id(self, :index) }
end
