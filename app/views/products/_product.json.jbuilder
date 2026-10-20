json.extract! product, :id, :name, :expires_on, :quantity, :created_at, :updated_at
json.url product_url(product, format: :json)
