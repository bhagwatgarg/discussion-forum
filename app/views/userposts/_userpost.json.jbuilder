json.extract! userpost, :id, :title, :content, :created_at, :updated_at
json.url userpost_url(userpost, format: :json)
