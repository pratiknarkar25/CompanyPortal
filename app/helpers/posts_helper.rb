# frozen_string_literal: true

# These methods will be used in post views
module PostsHelper
  def price_text(category)
    case category.name
    when 'Flats for rent', 'Vacancy for room mate'
      return 'Monthly Rent (Rs)'
    when 'Sell a car', 'Sell a bike'
      return 'Total Price (Rs)'
    else
      'Price (Rs)'
    end
  end
end
