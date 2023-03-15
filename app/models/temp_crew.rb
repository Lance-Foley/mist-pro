# == Schema Information
#
# Table name: temp_crews
#
#  id         :bigint           not null, primary key
#  end_date   :date
#  name       :string
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  crew_id    :bigint           not null
#  job_id     :bigint           not null
#
# Indexes
#
#  index_temp_crews_on_crew_id  (crew_id)
#  index_temp_crews_on_job_id   (job_id)
#
# Foreign Keys
#
#  fk_rails_...  (crew_id => crews.id)
#  fk_rails_...  (job_id => jobs.id)
#
class TempCrew < ApplicationRecord
  belongs_to :job
  belongs_to :crew
  has_many :temp_employees

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :temp_crews, partial: 'temp_crews/index', locals: {temp_crew: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :temp_crews, target: dom_id(self, :index) }

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    return unless end_date < start_date

    errors.add(:end_date, 'must be after the start date')
  end

  def total_hours
    temp_employees.sum(&:adjusted_hours)
  end
end
