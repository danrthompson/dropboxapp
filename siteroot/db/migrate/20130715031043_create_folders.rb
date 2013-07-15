class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.integer :depth
      t.text :label
      t.integer :order

      t.belongs_to :page
      t.belongs_to :folder

      t.timestamps
    end
  end
end
