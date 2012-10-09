class Contact < ActiveRecord::Base
  attr_accessible :birthday, :business_function, :cell, :department, :department_id, :name, :phone, :customer
  
  #=========================== associations <--------------------------------------------
  belongs_to :customer
  belongs_to :department, class_name: "BusinessDepartment"
  has_many :emails, :as => :emailable

  #=========================== validations <--------------------------------------------
  validates :name, :presence => true, length: { maximum: 60 }
  validates :customer_id, :presence => true
  validates_uniqueness_of :name, :scope => :customer_id

  #=========================== search <--------------------------------------------  
  
  def self.search_by_params(results=nil, query)
    
    results = self.send(:relation) unless results
    where = {}
    
    query.each do |k,v|
      if k=="name"
        where.merge! 'upper(name) LIKE ?', "%#{name}%"
      elsif self.instance_methods.include?((k.to_s+"_id").to_sym)
        where.merge! :"#{k}_id" => v
        puts "mergin "+k
      elsif self.instance_methods.include?(k.to_sym)
        where.merge! k.to_sym => v
      end
    end
    
    puts query.to_yaml
    puts "============>"+where.to_yaml
    results.where(where)
  end
  
  
  def self.search_by_name(results, name)
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
  
  def self.search_by_department
    @contacts = @customer.contacts.where( @selected_department ? ({ department_id: @selected_department }) : "1=1")
  end
  
end
