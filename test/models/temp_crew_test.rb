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
require "test_helper"

class TempCrewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
