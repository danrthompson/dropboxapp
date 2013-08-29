class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable, :timeoutable
  # soon: :confirmable, :lockable, :recoverable, :omniauthable
  # maybe: :token_authenticatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  validates :username, presence: true
  validates :username, uniqueness: true
end
