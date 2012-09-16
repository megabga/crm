require 'spec_helper'

describe TaskType do

  before do
    type = TaskType.crate(name: Faker::Name.first)
  end
  
  subject { type }
  
  it { should respond_to(:name) }
  
  it { should be_valid }
  
end
