class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.text :title
      t.text :description

      t.belongs_to :page

      t.timestamps
    end
  end
end
