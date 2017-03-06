ThinkingSphinx::Index.define :college, with: :active_record do
  indexes :name
  indexes degree
  indexes university
  indexes year_of_graduation
end