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
require "test_helper"

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
