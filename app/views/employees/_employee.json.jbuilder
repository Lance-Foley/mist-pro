json.extract! employee, :id, :first_name, :last_name, :hire_date, :wage, :hours, :status, :crew_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
