json.extract! product, :id, :title, :description, :rating, :created_at, :updated_at
json.url product_url(product, format: :json)
