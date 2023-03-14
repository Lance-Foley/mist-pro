json.extract! project, :id, :name, :type, :start_date, :end_date, :cost, :amount_down, :amount_down_date, :amount_with_held, :amount_with_held_date, :contact_info, :status, :client_id, :created_at, :updated_at
json.url project_url(project, format: :json)
