class Employee < ApplicationRecord
  belongs_to :crew
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :employees, partial: "employees/index", locals: {employee: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :employees, target: dom_id(self, :index) }
end
