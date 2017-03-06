class Project < ActiveRecord::Base
  belongs_to :resume

  after_save ThinkingSphinx::RealTime.callback_for(:project)
end
