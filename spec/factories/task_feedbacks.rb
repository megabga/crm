# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task_feedback do
    task_id 1
    date "2012-09-11 04:08:36"
    notes { Faker::Lorem.setence(2) }
    user
    status_id SystemTaskStatus.OPENED
    resolution_id SystemTaskResolution.BLOCKED
  end
end
