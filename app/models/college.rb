class College < ActiveRecord::Base
  has_one :location, as: :addressable
  belongs_to :resume

  after_save ThinkingSphinx::RealTime.callback_for(:college)
end
