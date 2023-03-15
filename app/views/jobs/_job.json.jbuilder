json.extract! job, :id, :name, :bid_hours, :actual_hours, :start_date, :end_date, :cost_code_id, :cost, :created_at, :updated_at
json.url job_url(job, format: :json)
