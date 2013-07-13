class CreateDbUsers < ActiveRecord::Migration
  def change
    create_table :db_users do |t|

      t.timestamps
    end
  end
end
