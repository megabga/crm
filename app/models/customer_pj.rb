class CustomerPj < ActiveRecord::Base
  # attr_accessible :title, :body
  
  attr_protected
  
  has_one	:customer	, :as => :person
  belongs_to	:sguimentos	
  belongs_to	:atividades
end
