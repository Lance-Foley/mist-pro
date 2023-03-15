json.extract! change_order, :id, :name, :cost, :amount_down, :amount_with_held, :start_date, :end_date, :amount_down_date, :amount_with_held_date, :project_id, :created_at, :updated_at
json.url change_order_url(change_order, format: :json)
