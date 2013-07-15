class AddBelongsFoldersToResource < ActiveRecord::Migration
  def change
  	add_column :resources, :folder_id, :integer
  end
end
