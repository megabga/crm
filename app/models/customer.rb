class Customer < ActiveRecord::Base
  attr_accessible :doc, :doc_rg, :name, :birthday, :name_sec, :address, :state_id, :city_id, :district_id,
                  :is_customer, :segment_id, :activity_id, :person_type, :person_id, :postal, :emails, :complete,
                  :disable, :phone, :fax, :social_link, :site
  #attr_protected 
  
  default_scope where("enabled = TRUE")
  
  
  #=========================== associations <--------------------------------------------
  
  belongs_to :person, :polymorphic => true, dependent: :destroy
  has_many :histories
  has_many :emails, :as => :emaiable
  has_many :contacts
  
  belongs_to :state
  belongs_to :city
  belongs_to :district
  
  #=========================== VALIDATE <------------------------------------------------
  
  
  VALID_NAME_REGEX = /\A\w[\w ]*\z/i
  
  validates :doc, :customer_cnpj => true
  validates :doc, :presence => true, :uniqueness => true, :if => :doc_needs?
  validates :name, :presence => true, length: { maximum: 60 }, format: { with: VALID_NAME_REGEX }, uniqueness: true
  validates :address, :presence => true, :if => :complete?
  validates :state_id, :presence => true, :if => :complete?
  validates :city_id, :presence => true, :if => :complete?
  validates :district_id, :presence => true, :if => :complete?
  
  # -------------------------------------------------------------------------> validates
  
  def self.search(customers, name)
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
      logger.debug customers
      ret = customers.where(conditions)
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
  
  def customer_pj=(customer_pj)
    
  end
end
