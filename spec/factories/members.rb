require 'faker'

FactoryGirl.define do
  factory :member do |f|
    f.First_Name { Faker::Name.first_name }
    f.Last_Name{ Faker::Name.last_name }
    f.Zip{ Faker::Address.zip}
    f.Main_Phone{ Faker::PhoneNumber.extension }
    f.Main_Email{ Faker::Internet.safe_email}
    f.Date_Joined_TAA{"2015"}
    f.password_digest{"123456"}
  end
end