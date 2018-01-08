# frozen_string_literal: true

# rubocop:disable BlockLength
FactoryGirl.define do
  factory :post do
    factory :rent_post do
      title '2 BHK In Baner For Rent'
      description '<p> The house is unfurnished. It has easy access to market,
  schools, hospitals, banks and ATMs as well. *Preferred for family or
  working bachelors. *Double car parking. *it has sitting place also 9*11
  ft *Modern amenities are under construction.. *Only Vegetarians are
  preferred. </p>'
      category_id { FactoryGirl.create(:flats_for_rent).try(:id) }
      user_id { FactoryGirl.create(:admin_user).try(:id) }
      address '24, Samarth Colony , Near Pride Platinum, Pune'
      zip 411_007
      price 10_000
      contact_number '9999999992'
    end

    factory :vacancy_post do
      title 'Need Male Roommate in Magarpatta, Pune'
      description '<p>Accommodation for Boyes at Magarpatta City , Hadapsar,
  Pune Facilities provided &bull; No brokerage &bull; TV with cable
  connection &bull; Refrigerator &bull; Gas Stove &amp; Gas &bull;
  Individual Cupboards with Lockers. &bull; Solar Water Heating
  System &bull; 24 Hrs Water Supply &bull; Lift with Generator backup
  &bull; 24 Hrs Security &bull; Parking for 2/4 wheelers. &bull; Maid for
  cleaning rooms &bull; Utility Bills paid by the PG provider &bull; Office,
  Shopping complex, ATMs, Banks, Cyber cafe, hotels are inside the society at
  walking distance &bull; NO Brokerage &bull;Two sharing Rent - 6000/-</p>'
      category_id { FactoryGirl.create(:roommate_vacancy).try(:id) }
      user_id { FactoryGirl.create(:admin_user).try(:id) }
      address 'Towards John Deere Inner Cir, Magarpatta City, Hadapsar, Pune, \
  Maharashtra 411028, India'
      zip 411_028
      price 6_200
      contact_number '9999999999'
    end

    factory :sell_car_post do
      title 'Maruti Suzuki Ertiga Vdi, 2014, Diesel'
      description '<p>maruti suzuki ertiga 2014 vdi abs optional model.very
  well maintain showroom condition single owner car with comphransive
  insuranse driven only 77000 km .new tyer new battery.</p><p>Fixed Price: Yes
  <br /> Make: Maruti Suzuki<br /> Model: Ertiga<br /> Variant: Ertiga VDi
  <br /> Vehicle Type: SUV<br /> Mileage: 77,000 KMS<br /> Make Year:
  2014<br /> Make Month: October<br /> Fuel type: Diesel<br />
  Transmission type: Manual<br /> Condition: Used<br /> Insurance
   Type: Comprehensive<br /> Insurance Year: 2018<br /> No. of
  Owners: First<br /> Colors: White<br /> Interior color: Beige
  <br /> One Time Tax: Individual<br />
  Registration Place: MH<br /> Plate: 14</p>'
      category_id { FactoryGirl.create(:sell_car).try(:id) }
      user_id { FactoryGirl.create(:admin_user).try(:id) }
      address 'Sahakar Nagar, Pune'
      zip 411_009
      price 420_000
      contact_number '9999999992'
    end

    factory :sell_bike_post do
      title 'Harley Davidson Street'
      description '<p>Harley Davidson Street750<br />Matt Black colour.
  <br />MH12 reg, 1st
  Owner.<br />7000kms.<br />Comprehensive Insurance valid.<br />VIP
  number \' 567 \'<br />Mint condition.<br />Accessories : <br />1)
  Screaming Eagle Exhaust.<br />2) Screaming Eagle Air Filter.<br />3)
  Harley Davidson Engine Guard.<br />4) Backrest.<br />5) Daymaker HID
  headlight.<br />6) Main Stand.<br />7) Aftermarket Foot Pegs.<br />8)
  Brake and Gear padle.<br />CALL TIMINGS :  10am to 7pm. &nbsp; &nbsp;
  &nbsp; &nbsp;&nbsp;</p>'
      category_id { FactoryGirl.create(:sell_bike).try(:id) }
      user_id { FactoryGirl.create(:admin_user).try(:id) }
      address 'Somwar peth, Pune'
      zip 411_011
      price 420_000
      contact_number '9999999992'
    end
  end
end
