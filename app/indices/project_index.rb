ThinkingSphinx::Index.define :project, with: :active_record do
  indexes title
  indexes domain
  indexes name
end