# frozen_string_literal: true

prefix = 'Here you can add a post to '
suffix = ' by adding all the details in the description'
rent_flat_category = Category.find_or_create_by(
  name: 'Flats for rent',
  description: prefix + 'rent out a flat' + suffix
)

roommate_vacancy_category = Category.find_or_create_by(
  name: 'Vacancy for room mate',
  description: prefix + 'mention the roommate vacancy for a flat' + suffix
)

sell_car_category = Category.find_or_create_by(
  name: 'Sell a car',
  description: prefix + 'sell a car' + suffix
)

sell_bike_category = Category.find_or_create_by(
  name: 'Sell a bike',
  description: prefix + 'sell a bike' + suffix
)

# Uncomment & run this once user with email
# pratik.narkar@synerzip.com is created
user = User.find_by(email: 'pratik.narkar@synerzip.com')
if user.role != 'admin'
  user.role = 'admin'
  Rails.logger.info "User with email id #{user.email} is admin now" if user.save
end

# -------------------- Sample Flat Post ------------------------
sample_flat_post = Post.find_or_create_by(
  title: '3 BHK In Baner For Rent',
  description: '<p> The house is unfurnished. It has easy access to market,
  schools, hospitals, banks and ATMs as well. *Preferred for family or
  working bachelors. *Double car parking. *it has sitting place also 9*11
  ft *Modern amenities are under construction.. *Only Vegetarians are
  preferred. </p>',
  category_id: rent_flat_category.id,
  user_id: user.id,
  address: '24, Samarth Colony , Near Pride Platinum, Pune',
  zip: 411_007,
  price: 420_000,
  contact_number: '9999999992'
)
Rails.logger.info 'Added sample flat post' if sample_flat_post

if sample_flat_post.pictures.blank?
  (1..5).each do |i|
    image_path = "#{Rails.root}/app/assets/images/flat#{i}.jpg"
    image_file = File.new(image_path)
    sample_flat_post.pictures.create(image: image_file)
    Rails.logger.info "Added image flat#{i}.jpg for sample flat post"
  end
end

# -------------------- Sample Roommate Vacancy Post -----------------
sample_vacancy_post = Post.find_or_create_by(
  title: 'Need Male Roommate in Magarpatta, Pune',
  description: '<p>Accommodation for Boyes at Magarpatta City , Hadapsar,
  Pune Facilities provided &bull; No brokerage &bull; TV with cable
  connection &bull; Refrigerator &bull; Gas Stove &amp; Gas &bull;
  Individual Cupboards with Lockers. &bull; Solar Water Heating
  System &bull; 24 Hrs Water Supply &bull; Lift with Generator backup
  &bull; 24 Hrs Security &bull; Parking for 2/4 wheelers. &bull; Maid for
  cleaning rooms &bull; Utility Bills paid by the PG provider &bull; Office,
  Shopping complex, ATMs, Banks, Cyber cafe, hotels are inside the society at
  walking distance &bull; NO Brokerage &bull;Two sharing Rent - 6000/-</p>',
  category_id: roommate_vacancy_category.id,
  user_id: user.id,
  address: 'Towards John Deere Inner Cir, Magarpatta City, Hadapsar, Pune, \
  Maharashtra 411028, India',
  zip: 411_028,
  price: 6200,
  contact_number: '9999999999'
)
Rails.logger.info 'Added sample roommate vacancy post' if sample_vacancy_post

if sample_vacancy_post.pictures.blank?
  (1..3).each do |i|
    image_path = "#{Rails.root}/app/assets/images/vacancy#{i}.jpg"
    image_file = File.new(image_path)
    sample_vacancy_post.pictures.create(image: image_file)
    Rails.logger.info "Added image vacancy#{i}.jpg for sample vacancy post"
  end
end

# -------------------- Sample Car Post ------------------------
sample_car_post = Post.find_or_create_by(
  title: 'Maruti Suzuki Ertiga Vdi, 2014, Diesel',
  description: '<p>maruti suzuki ertiga 2014 vdi abs optional model.very
  well maintain showroom condition single owner car with comphransive
  insuranse driven only 77000 km .new tyer new battery.</p><p>Fixed Price: Yes
  <br /> Make: Maruti Suzuki<br /> Model: Ertiga<br /> Variant: Ertiga VDi
  <br /> Vehicle Type: SUV<br /> Mileage: 77,000 KMS<br /> Make Year:
  2014<br /> Make Month: October<br /> Fuel type: Diesel<br />
  Transmission type: Manual<br /> Condition: Used<br /> Insurance
   Type: Comprehensive<br /> Insurance Year: 2018<br /> No. of
  Owners: First<br /> Colors: White<br /> Interior color: Beige
  <br /> One Time Tax: Individual<br />
  Registration Place: MH<br /> Plate: 14</p>',
  category_id: sell_car_category.id,
  user_id: user.id,
  address: 'Sahakar Nagar, Pune',
  zip: 411_009,
  price: 420_000,
  contact_number: '9999999992'
)

Rails.logger.info 'Added sample car post' if sample_car_post

if sample_car_post.pictures.blank?
  (1..3).each do |i|
    image_path = "#{Rails.root}/app/assets/images/ertiga#{i}.jpg"
    image_file = File.new(image_path)
    sample_car_post.pictures.create(image: image_file)
    Rails.logger.info "Added image maruti-suzuki-ertiga-vdi#{i}.jpg for \
    sample car post"
  end
end

# -------------------- Sample Bike Post -----------------
sample_bike_post = Post.find_or_create_by(
  title: 'Harley Davidson Street',
  description: '<p>Harley Davidson Street750<br />Matt Black colour.
  <br />MH12 reg, 1st
  Owner.<br />7000kms.<br />Comprehensive Insurance valid.<br />VIP
  number \' 567 \'<br />Mint condition.<br />Accessories : <br />1)
  Screaming Eagle Exhaust.<br />2) Screaming Eagle Air Filter.<br />3)
  Harley Davidson Engine Guard.<br />4) Backrest.<br />5) Daymaker HID
  headlight.<br />6) Main Stand.<br />7) Aftermarket Foot Pegs.<br />8)
  Brake and Gear padle.<br />CALL TIMINGS :  10am to 7pm. &nbsp; &nbsp;
  &nbsp; &nbsp;&nbsp;</p>',
  category_id: sell_bike_category.id,
  user_id: user.id,
  address: 'Somwar peth, Pune',
  zip: 411_011,
  price: 420_000,
  contact_number: '9999999992'
)

Rails.logger.info 'Added sample bike post' if sample_bike_post

if sample_bike_post.pictures.blank?
  (1..4).each do |i|
    bike_image_path = "#{Rails.root}/app/assets/images/harley#{i}.jpg"
    bike_image_file = File.new(bike_image_path)
    sample_bike_post.pictures.create(image: bike_image_file)
    Rails.logger.info "Added image harley-davidson-street#{i}.jpg for \
    sample bike post"
  end
end

Post.where(deactivated: nil).find_in_batches(batch_size: 10) do |group|
  group.each do |post|
    updated_post = post.update_attributes(deactivated: false)
    Rails.logger.info "Updated post: #{post.attributes}" if updated_post
  end
end
