class AddAttachmentMainImageToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :main_image
    end
  end

  def self.down
    drop_attached_file :pages, :main_image
  end
end
