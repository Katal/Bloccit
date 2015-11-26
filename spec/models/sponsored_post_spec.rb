require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
  let(:topic) { Topic.create!(name: "New Topic Title", description: "New Topic Description")}
  let(:sponsored_post) { SponsoredPost.create!(title: "New Sponsored Post Title", body: "New Sponsored Post Body", price: 3500, topic: topic) }
 
   it { should belong_to(:topic) }
   
   describe "attributes" do

     it "should respond to title" do
       expect(sponsored_post).to respond_to(:title)
     end

     it "should respond to body" do
       expect(sponsored_post).to respond_to(:body)
     end

     it "should respond to price" do
     	expect(sponsored_post).to respond_to(:price)
     end

   end

end
