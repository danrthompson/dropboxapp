class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :account_id
      t.string :url
      t.boolean :contact_available
      t.string :title
      t.string :subtitle
      t.text :description

      t.timestamps
    end
    add_index :pages, :url, :unique => true
  end
end
