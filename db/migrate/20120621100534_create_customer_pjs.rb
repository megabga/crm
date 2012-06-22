class CreateCustomerPjs < ActiveRecord::Migration
  def change
    create_table :customer_pjs do |t|
      t.string	:fax	, :limit => 15
      t.integer	:qtd_funcionarios	
      t.integer	:segmento_id	
      t.integer	:atividade_id

      t.timestamps
    end
  end
end
