FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
  
  factory :customer do
    name Faker::name
    birthday 100.years.ago
    doc '0'*14
    complete false
  end
  
  
  factory :customer_pj do
    fax 9999
    after_build do |pj|
      FactoryGirl.create(:customer, :person => pj)
    end
  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end
  
  factory :contact do
    name Faker::Name.name
    birthday 23.years.ago
    customer
  end
  
  factory :email do
    email Faker::Internet.email
  end
  
  factory :system_ability do
    factory :read do
      name "READ"
    end
  end
  
  factory :system_module do
    factory :module_customer do
      name "Customer"
    end
  end
  
end