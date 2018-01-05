FactoryGirl.define do
  prefix = 'Here you can add a post to '
  suffix = ' by adding all the details in the description'
  factory :category do
	  factory :flats_for_rent do
	     name 'Flats for rent'
	     description { (prefix + 'rent out a flat' + suffix) }
	  end

	  factory :roommate_vacancy do
	    name 'Vacancy for room mate'
	    description { prefix + 'mention the roommate vacancy for a flat' + suffix }
	  end

	  factory :sell_car do
	    name 'Sell a car'
	    description { prefix + 'sell a car' + suffix }
	  end

	  factory :sell_bike do
	    name 'Sell a bike'
	    description { prefix + 'sell a bike' + suffix }
	  end
	  
  end

end
