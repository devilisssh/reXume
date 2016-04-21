json.array!(@resume_data) do |resume_datum|
  json.extract! resume_datum, :id, :name, :email, :phone, :summary
  json.url resume_datum_url(resume_datum, format: :json)
end
