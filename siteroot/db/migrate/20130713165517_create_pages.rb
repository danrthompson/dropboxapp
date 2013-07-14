class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :title
      t.text :description

      t.belongs_to :db_user

      t.timestamps
    end
  end
end
