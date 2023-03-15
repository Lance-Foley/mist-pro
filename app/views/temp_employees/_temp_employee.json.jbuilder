json.extract! temp_employee, :id, :start_date, :end_date, :override_hours, :override_type, :temp_crew_id, :employee_id, :job_id, :created_at, :updated_at
json.url temp_employee_url(temp_employee, format: :json)
