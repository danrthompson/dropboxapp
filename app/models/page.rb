class Page < ActiveRecord::Base
  attr_accessible :account_id, :contact_available, :description, :subtitle, :title, :url

  belongs_to :account
  has_many :file_sections, dependent: :destroy
end
