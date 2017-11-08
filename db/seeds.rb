# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

prefix = "Here you can add a post to "
suffix = " by adding all the details in the description"
categories = Category.create([
  	{ name: 'Flat for rent', description: prefix + 'rent out a flat' + suffix }, 
  	{ name: 'Vacancy for room mate', description: prefix + 'mention the roommate vacancy for a flat' + suffix },
  	{ name: 'Sell a car', description: prefix + 'sell a car' + suffix },
  	{ name: 'Sell a bike', description: prefix + 'sell a bike' + suffix }])