# == Schema Information
#
# Table name: jobs
#
#  id           :bigint           not null, primary key
#  actual_hours :decimal(, )
#  bid_hours    :decimal(, )
#  cost         :decimal(, )
#  end_date     :date
#  jobable_type :string           not null
#  name         :string
#  start_date   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  cost_code_id :bigint           not null
#  jobable_id   :bigint           not null
#
# Indexes
#
#  index_jobs_on_cost_code_id  (cost_code_id)
#  index_jobs_on_jobable       (jobable_type,jobable_id)
#
# Foreign Keys
#
#  fk_rails_...  (cost_code_id => cost_codes.id)
#
class Job < ApplicationRecord
  belongs_to :cost_code
  has_many :temp_crews
  has_many :temp_employees
  belongs_to :jobable, polymorphic: true
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :jobs, partial: 'jobs/index', locals: {job: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :jobs, target: dom_id(self, :index) }

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date
  validates :bid_hours, presence: true

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    return unless end_date < start_date

    errors.add(:end_date, 'must be after the start date')
  end

  def total_hours
    temp_crews.sum(&:total_hours) + temp_employees.sum(&:adjusted_hours)
  end
end
