class AddMainImageProcessingToPage < ActiveRecord::Migration
  def change
  	add_column :pages, :main_image_processing, :boolean
  end
end