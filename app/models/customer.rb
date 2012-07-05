class Customer < ActiveRecord::Base
  attr_accessible :doc, :doc_rg, :name, :birthday, :name_sec, :address, :state_id, :city_id, :district_id,
                  :is_customer, :segment_id, :activity_id, :person_type, :person_id, :postal, :emails, :complete, :disable
  #attr_protected 
  
  validates :doc, :customer_cnpj => true
  validates :doc, :presence => true, :uniqueness => true, :if => :doc_needs?
  validates :name, :presence => true
  validates :address, :presence => true, :if => :complete?
  validates :state_id, :presence => true, :if => :complete?
  validates :city_id, :presence => true, :if => :complete?
  validates :district_id, :presence => true, :if => :complete?
  
  belongs_to :person, :polymorphic => true, dependent: :destroy
  has_many :histories
  has_many :emails
  
  belongs_to :state
  belongs_to :city
  belongs_to :district
  
  def self.search(name)
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
      find(:all, :conditions => conditions)
    else
      []
    end
    
  end
  
  def format_address
    address + ", " + (self.district ? self.district.name : "") + ", " + (self.city ? self.city.name : "") + ", " + (self.state ? self.state.name : "")
  end
  
  def doc_needs?
    self.complete? || (doc !="" && doc != "0"*11 && doc != "0"*14)
  end
  
  def complete?
    complete
  end
end
