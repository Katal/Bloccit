puts RandomData.random_sentence

FactoryGirl.define do
	pw = RandomData.random_sentence
   
   factory :user do
   	# pw = RandomData.random_sentence
     name RandomData.random_name
     sequence(:email){|n| "user#{n}@factory.com" }
     # password RandomData.random_sentence
     password pw
     password_confirmation pw
     role :member
   end
 end