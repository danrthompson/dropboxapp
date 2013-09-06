class Page < ActiveRecord::Base
  attr_accessible :contact_available, :description, :subtitle, :title, :url, :main_image

  has_attached_file :main_image, :styles => { :banner => "1200" }, :default_url => "/admin_uploads/default_main_image.jpg", path: "/#{ENV['S3_PATH_PREFIX']}:class/:attachment/:id_partition/:style/:hash.:extension"

  process_in_background :main_image, processing_image_url: "https://s3.amazonaws.com/soapboxapp/admin_uploads/processing-img.png"

  validates_attachment :main_image, :content_type => { :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] }, :size => { :in => 0..500.kilobytes }

  belongs_to :account
  has_many :file_sections, dependent: :destroy

  validates :account_id, :url, presence: true
  validates :url, uniqueness: true

  def to_param
  	self.url
  end



end
