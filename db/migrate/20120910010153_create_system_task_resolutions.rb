class CreateSystemTasktask_resolutions < ActiveRecord::Migration
  def change
    create_table :system_task_resolutions do |t|
      t.string :name
    end
  end
end
