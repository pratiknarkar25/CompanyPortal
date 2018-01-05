FactoryGirl.define do
	factory :user do
	  factory :admin_user do
	    provider "google_oauth2"
	    sequence(:uid) { |n| "#{n}" }
	    sequence(:name) { |n| "Pratik Narkar#{n}" }
	    email 'pratik.narkar@synerzip.com'
	    role 'admin'
	  end
	end
end
