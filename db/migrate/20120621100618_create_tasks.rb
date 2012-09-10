class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :interested, :polymorphic => true
      t.references :contact, :polymorphic => true
      t.integer	:user_id, :limit => 120
      t.datetime :due_time
      t.datetime :finish_time
      t.integer	:activity_id
      t.string	:notes, :limit => 140
      t.string :description, :limit => 1000
      t.integer	:feedback_id
      t.integer	:status_id
      
      t.timestamps
    end
  end
end
