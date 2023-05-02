# == Schema Information
#
# Table name: jobs
#
#  id              :bigint           not null, primary key
#  actual_hours    :integer
#  bid_hours       :integer
#  cost_code       :string
#  end_date        :date
#  name            :string
#  start_date      :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  change_order_id :bigint
#  project_id      :bigint           not null
#
# Indexes
#
#  index_jobs_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
class Job < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :change_order, optional: true
  has_one :client, through: :project
  has_many :job_assignments
  has_many :employees, through: :job_assignments
  has_many :crews, through: :job_assignments
  validate :project_or_change_order
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to(:jobs, partial: "jobs/index", locals: {job: self}) }
  after_update_commit -> { broadcast_replace_later_to(self) }
  after_destroy_commit -> { broadcast_remove_to(:jobs, target: dom_id(self, :index)) }

  def self.ransackable_attributes(_auth_object = nil)
    %w[
      actual_hours
      bid_hours
      change_order_id
      cost_code
      created_at
      end_date
      id
      name
      project_id
      start_date
      updated_at
    ]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[change_order client crews employees job_assignments project]
  end

  private

  def project_or_change_order
    return if project_id.nil? ^ change_order_id.nil?

    errors.add(
      :base,
      "A job must belong to either a project or a change order"
    )
  end
end
