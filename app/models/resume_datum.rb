class ResumeDatum < ActiveRecord::Base
  belongs_to :user
  has_many :skills
  has_many :projects
  has_many :colleges
  has_one :address, as: :addressable

  accepts_nested_attributes_for :skills, :projects, :colleges, :address, allow_destroy: true
end
