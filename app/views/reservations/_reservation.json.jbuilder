json.extract! reservation, :id, :city, :date, :user_id, :bike_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
