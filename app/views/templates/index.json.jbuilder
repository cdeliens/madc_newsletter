json.array!(@templates) do |template|
  json.extract! template, :id, :title, :html_body
  json.url template_url(template, format: :json)
end
