class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable, :timeoutable
  # soon: :confirmable, :lockable, :recoverable, :omniauthable
  # maybe: :token_authenticatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  has_one :account, dependent: :destroy

  validates :username, presence: true
  validates :username, uniqueness: true

  after_create :create_users_account

  protected

  def create_users_account
  	account = self.build_account
  	account.subscription_tier = 1
  	account.save
  end

end
