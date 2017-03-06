ThinkingSphinx::Index.define :user, with: :real_time do
  indexes first_name
  indexes last_name
end