class CreateUsersGroups < ActiveRecord::Migration
  def change
    create_table :users_groups do |t|
      t.string :name
      t.boolean :enabled,  :default => true
      t.boolean :system,   :default => false
      t.timestamps
    end
  end
end
