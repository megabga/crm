class Customer < ActiveRecord::Base
  #attr_accessible :nome, :endereco, :bairro, :city
  attr_protected
  
  
  belongs_to	:person	, :polymorphic => true, dependent: :destroy
  has_many :histories
  
  
  def self.search(search)
    if search
      conditions = []
      conditions << ['name LIKE ?', "%#{search}%"]
      find(:all, :conditions => conditions)
    else
      find(:all)
    end
  end
  
end
