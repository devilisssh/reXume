json.array!(@skills) do |skill|
  json.extract! skill, :id, :name, :proficiency, :duration
  json.url skill_url(skill, format: :json)
end
