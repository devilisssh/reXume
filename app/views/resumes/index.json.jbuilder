json.array!(@resumes) do |resume|
  json.extract! resume, :id, :name, :email, :phone, :summary
  json.url resume_url(resume, format: :json)
end
