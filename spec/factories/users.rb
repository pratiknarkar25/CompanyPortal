# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    factory :admin_user do
      provider 'google_oauth2'
      sequence(:uid) { |n| n&.to_s }
      sequence(:name) { |n| "Pratik Narkar#{n}" }
      email 'pratik.narkar@synerzip.com'
      role 'admin'
    end

    factory :normal_user do
      provider 'google_oauth2'
      sequence(:uid) { |n| n&.to_s }
      sequence(:name) { |n| "Pratik Narkar#{n}" }
      email 'pratik.narkar1@synerzip.com'
    end
  end
end
