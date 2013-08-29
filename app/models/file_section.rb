class FileSection < ActiveRecord::Base
	attr_accessor :user_id
  attr_accessible :rank, :title

  belongs_to :page

  validates :page_id, :rank, :title, :user_id, presence: true
  validate :page_belongs_to_user

  protected

  def page_belongs_to_user
  	page = Page.find_by_id(self.page_id)
  	if not page then
  		errors.add(:page, "does not exist")
  	elsif page.account.user_id != self.user_id then
  		errors.add(:page, "does not belong to you")
  	end
  end
end
