ThinkingSphinx::Index.define :project, with: :real_time do
  indexes title
  indexes domain
  indexes :name
  indexes tech_used
end