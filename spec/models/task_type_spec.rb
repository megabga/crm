require 'spec_helper'

describe TaskType do

  let(:type) { TaskType.create(name: Faker::Name.first_name) }
  
  subject { type }
  
  it { should respond_to(:name) }
  
  it { should be_valid }
  
end
