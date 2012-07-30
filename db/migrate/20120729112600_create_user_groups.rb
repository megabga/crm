class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.integer :user_id
      t.integer :users_group_id

      t.timestamps
    end
    
    add_index :user_groups, :user_id
    add_index :user_groups, :users_group_id
    add_index :user_groups, [:user_id, :users_group_id], unique: true    
  end
end
