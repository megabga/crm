class Customer < ActiveRecord::Base
  #attr_accessible :nome, :endereco, :bairro, :city
  attr_protected
  
  belongs_to	:person	, :polymorphic => true, dependent: :destroy
  has_many :history_pfs
end
