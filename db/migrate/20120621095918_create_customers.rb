class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string	:name	, :limit => 60, :null => false
      t.string	:doc	, :limit => 14
      t.string	:doc_rg	, :limit => 22
		
      t.string	:nome_segundo	, :limit => 40
      t.string	:endereco	, :limit => 80
      t.integer	:bairro_id	
      t.integer	:city_id	
      t.string	:estado	, :limit => 2
      t.string	:cep	, :limit => 8
      t.string	:obs	, :limit => 500
      t.date  	:data_nascimento	
		
      t.string	:fone	, :limit => 15
      t.string	:rede_social	, :limit => 200
      t.string	:site	, :limit => 200
      t.boolean	:cliente	, :default => false
      t.boolean	:pj	, :default => true
      t.integer	:parent_id
      
      t.boolean :disabled

      t.references :person, :polymorphic => true

      t.timestamps
    end
  end
end
