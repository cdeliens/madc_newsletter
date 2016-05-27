json.array!(@newsletters) do |newsletter|
  json.extract! newsletter, :id, :name, :subscribers_list_id
  json.url newsletter_url(newsletter, format: :json)
end
