class Page < ActiveRecord::Base
  attr_accessible :contact_available, :description, :subtitle, :title, :url

  belongs_to :account
  has_many :file_sections, dependent: :destroy

  validates :account_id, :url, presence: true
  validates :url, uniqueness: true

  def to_param
  	self.url
  end



end
