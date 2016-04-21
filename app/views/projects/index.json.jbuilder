json.array!(@projects) do |project|
  json.extract! project, :id, :name, :responsibilities, :domain, :duration, :title
  json.url project_url(project, format: :json)
end
