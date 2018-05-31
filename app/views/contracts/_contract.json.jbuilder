json.extract! contract, :id, :house_id, :user_id, :contract_date_start, :contract_date_end, :contract_status, :created_at
json.url contract_url(contract, format: :json)
