# frozen_string_literal: true

prefix = 'Here you can add a post to '
suffix = ' by adding all the details in the description'
Category.first_or_create([
                           { name: 'Flat for rent', description: prefix +
                            'rent out a flat' + suffix },
                           { name: 'Vacancy for room mate',
                             description: prefix +
                            'mention the roommate vacancy for a flat' +
                            suffix },
                           { name: 'Sell a car', description: prefix +
                            'sell a car' + suffix },
                           { name: 'Sell a bike', description: prefix +
                            'sell a bike' + suffix }
                         ])

user = User.find_by(email: 'pratik.narkar@synerzip.com')
user.role = 'admin'
Rails.logger.info "User with email id #{user.email} is admin now" if user.save
