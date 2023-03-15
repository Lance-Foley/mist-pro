# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  first_name :string
#  hire_date  :date
#  hours      :decimal(, )
#  last_name  :string
#  status     :string
#  wage       :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  crew_id    :bigint           not null
#
# Indexes
#
#  index_employees_on_crew_id  (crew_id)
#
# Foreign Keys
#
#  fk_rails_...  (crew_id => crews.id)
#
class Employee < ApplicationRecord
  belongs_to :crew
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :employees, partial: "employees/index", locals: {employee: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :employees, target: dom_id(self, :index) }
end
