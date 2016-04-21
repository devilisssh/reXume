class College < ActiveRecord::Base
  has_one :location, as: :addressable
  belongs_to :resume_datum
end
