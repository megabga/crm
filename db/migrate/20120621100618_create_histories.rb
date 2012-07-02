class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer	:customer_id	
      t.integer	:contact_id	
      t.integer	:customer_id	
      t.integer	:user_id	, :limit => 120
      t.datetime	:datetime	
      t.integer	:activity_id	
      t.string	:notes	
      t.integer	:feedback_id	
      t.integer	:status_id
      
      t.timestamps
    end
  end
end
