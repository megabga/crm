class CreateHistoryPfs < ActiveRecord::Migration
  def change
    create_table :history_pfs do |t|
      t.integer	:customer_id	
      t.integer	:comercial	, :limit => 120
      t.string	:receber_infos	, :default => true
      t.string	:pessoal	, :default => true
      
      t.timestamps
    end
  end
end
