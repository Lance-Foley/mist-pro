class Project < ApplicationRecord
  belongs_to :client
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :projects, partial: "projects/index", locals: {project: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :projects, target: dom_id(self, :index) }
end
