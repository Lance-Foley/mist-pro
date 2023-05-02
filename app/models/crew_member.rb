# == Schema Information
#
# Table name: crew_members
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  crew_id     :bigint           not null
#  employee_id :bigint           not null
#
# Indexes
#
#  index_crew_members_on_crew_id      (crew_id)
#  index_crew_members_on_employee_id  (employee_id)
#
# Foreign Keys
#
#  fk_rails_...  (crew_id => crews.id)
#  fk_rails_...  (employee_id => employees.id)
#
class CrewMember < ApplicationRecord
  belongs_to :crew
  belongs_to :employee
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :crew_members, partial: "crew_members/index", locals: {crew_member: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :crew_members, target: dom_id(self, :index) }
end
