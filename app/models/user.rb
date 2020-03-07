class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :subscribers
  # has_many :meetings, through: :subscribers
  has_and_belongs_to_many :meetings
  validate :email_val

  def email_val
      if(email.to_s.split('@')[1] != 'commutatus.com')
        errors.add(:email, 'Must be Commutatus mail')
      end
  end
end
