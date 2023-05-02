# == Schema Information
#
# Table name: crews
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Crew < ApplicationRecord
  has_many :job_assignments
  has_many :jobs, through: :job_assignments
  has_many :crew_members
  has_many :employees, through: :crew_members
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to(:crews, partial: 'crews/index', locals: { crew: self }) }
  after_update_commit -> { broadcast_replace_later_to(self) }
  after_destroy_commit -> { broadcast_remove_to(:crews, target: dom_id(self, :index)) }
end
