class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :resume

  validates :first_name, :last_name, presence: true

  after_save ThinkingSphinx::RealTime.callback_for(:user)

  def name
    "#{first_name} #{last_name}"
  end
end
