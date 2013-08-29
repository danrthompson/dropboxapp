class Account < ActiveRecord::Base
	belongs_to :user
	has_many :pages, dependent: :destroy

	validates :subscription_tier, :user_id, presence: true
end
