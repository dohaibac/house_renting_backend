json.extract! house, :id, :address, :province, :description, :house_owner, :house_status, :renting_price, :created_at, :user
json.url house_url(house, format: :json)
