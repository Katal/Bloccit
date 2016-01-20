require 'rails_helper'

RSpec.describe Rating, type: :model do
  it { should have_many(:topics) }
  it { should have_many(:posts) }



  #should have enum specs
  #should have spec to test update rating method
end
