class Contact < ActiveRecord::Base
  belongs_to :customers
  attr_accessible :birthday, :business_function, :cell, :departament, :name, :phone
end
