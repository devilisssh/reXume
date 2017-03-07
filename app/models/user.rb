class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_one :resume

  validates :first_name, :last_name, presence: true
  validate :only_xebia_email

  after_save ThinkingSphinx::RealTime.callback_for(:user)

  def name
    "#{first_name} #{last_name}"
  end

  def only_xebia_email
    unless email.downcase.match(/\@(xebia|xpirit|xebialabs)\.com/)
      errors.add(:base, 'Please Sign Up with you Xebia/Xpirit/XebiaLabs Email.')
      false
    end
  end
end
