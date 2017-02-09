# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(username: 'JoeT')
user2 = User.create(username: 'ThornOfCamora')
user3 = User.create(username: 'ManFromMars')

contact1 = Contact.create(name: 'joe', email: 'joe@aa.com', user_id: 1)
contact2 = Contact.create(name: 'locke', email: 'lamora@aa.com', user_id: 2)
contact3 = Contact.create(name: 'john', email: 'john@aa.com', user_id: 3)

contact_share1 = ContactShare.create(user_id: 1,contact_id: 2)
contact_share1 = ContactShare.create(user_id: 1,contact_id: 3)
