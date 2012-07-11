class Contact < ActiveRecord::Base
  attr_accessible :birthday, :business_function, :cell, :departament, :name, :phone, :customer
  
  #=========================== associations <--------------------------------------------
  belongs_to :customer
  has_many :emails, :as => :emailable

  #=========================== validations <--------------------------------------------
  VALID_NAME_REGEX = /\A\w+.*\s.*\z/i
  validates :name, :presence => true, length: { maximum: 60 }, format: { with: VALID_NAME_REGEX }, uniqueness: true
  validates :customer_id, :presence => true
    
  
  
end
