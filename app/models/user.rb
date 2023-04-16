class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ai_model
  has_many :authentication_token

  validates :email, format: { with: /\A\d+@fjuhsd\.org\z/, message: "must be an school email."}
end