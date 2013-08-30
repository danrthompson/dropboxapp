class Page < ActiveRecord::Base
	# attr_accessor :user_id
  attr_accessible :contact_available, :description, :subtitle, :title, :url

  belongs_to :account
  has_many :file_sections, dependent: :destroy

  # validates :account_id, :user_id, :url, presence: true
  validates :account_id, :url, presence: true
  validates :url, uniqueness: true
  # validate :account_belongs_to_user

  def to_param
  	self.url
  end

  protected

  # def account_belongs_to_user
  # 	account = Account.find_by_id(self.account_id)
  # 	if not account then
  # 		errors.add(:account, "does not exist")
  # 	elsif account.user_id != self.user_id then
  # 		errors.add(:account, "does not belong to you")
  # 	end
  # end

end
