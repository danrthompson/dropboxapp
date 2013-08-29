class CreateFileSections < ActiveRecord::Migration
  def change
    create_table :file_sections do |t|
      t.integer :page_id
      t.string :title
      t.integer :rank

      t.timestamps
    end
  end
end
