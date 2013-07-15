class AddDataToPages < ActiveRecord::Migration
  def change
    add_column :pages, :resources_header, :text
    add_column :pages, :resources_description, :text
  end
end
