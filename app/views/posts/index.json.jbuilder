json.array!(@posts) do |post|
  json.extract! post, :id, :Title, :content, :author
  json.url post_url(post, format: :json)
end
