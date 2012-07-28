class Contact < ActiveRecord::Base
  attr_accessible :birthday, :business_function, :cell, :departament, :name, :phone, :customer
  
  #=========================== associations <--------------------------------------------
  belongs_to :customer
  has_many :emails, :as => :emailable

  #=========================== validations <--------------------------------------------
  validates :name, :presence => true, length: { maximum: 60 }
  validates :customer_id, :presence => true
  validates_uniqueness_of :name, :scope => :customer_id

  #=========================== search <--------------------------------------------  
  def self.search(results, name)
    conditions = []
    conditions_and = []
    conditions_params = []
    if name
      name = name.upcase
      conditions_and << 'upper(name) LIKE ?'
      conditions_params << "%#{name}%"
    end
    
    conditions << conditions_and.join(" and ")
    conditions_params.each { |p| conditions << p  }
    
    if conditions.count>0
      logger.debug results
      ret = results.where(conditions)
    else
      []
    end
    
  end
  
end
