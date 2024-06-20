json.extract! payment_method, :id, :payment_description, :payment_type, :created_at, :updated_at
json.url payment_method_url(payment_method, format: :json)
