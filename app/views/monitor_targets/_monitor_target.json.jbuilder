json.extract! monitor_target, :id, :name, :url, :image, :status, :created_at, :updated_at
json.url monitor_target_url(monitor_target, format: :json)
json.image url_for(monitor_target.image)
