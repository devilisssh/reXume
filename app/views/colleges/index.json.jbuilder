json.array!(@colleges) do |college|
  json.extract! college, :id, :name, :degree, :year_of_graduation, :university
  json.url college_url(college, format: :json)
end
