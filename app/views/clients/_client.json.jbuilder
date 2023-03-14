json.extract! client, :id, :name, :email, :business_phone, :cell_phone, :secondary_name, :secondary_email, :secondary_business_phone, :secondary_cell_phone, :created_at, :updated_at
json.url client_url(client, format: :json)
