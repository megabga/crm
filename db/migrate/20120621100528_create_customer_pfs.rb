class CreateCustomerPfs < ActiveRecord::Migration
  def change
    create_table :customer_pfs do |t|
      t.string	:sexo	, :limit => 1
      t.integer	:empresa_id
      t.string	:endereco_comercial	, :limit => 120
      t.string	:setor	, :limit => 20
      t.string	:cargo	, :limit => 20
      t.string	:celular	, :limit => 15
      t.string	:formacao	, :limit => 20


      t.timestamps
    end
  end
end
