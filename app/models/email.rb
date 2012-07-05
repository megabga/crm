class Email < ActiveRecord::Base
  attr_accessible :customer_id, :email, :infos, :private
  
  belongs_to :customer
end
