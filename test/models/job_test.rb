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
require "test_helper"

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
