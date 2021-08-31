# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "deleting all"
Customer.destroy_all

puts "seeding"
12.times do 
    Customer.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        active: Faker::Boolean.boolean
    )
end
50.times do
    Order.create!(
        customer_id: Customer.all.sample.id,
        order_date: Faker::Date.between(from: 364.days.ago, to: Date.today),
        total: Faker::Number.decimal(l_digits: 3, r_digits: 2)
    )
end
80.times do
    OrderItem.create!(
        order_id: Order.all.sample.id,
        item_id: Faker::Number.within(range: 101..500),
        quantity: Faker::Number.within(range: 1..10),
        price: Faker::Number.decimal(l_digits: 2,r_digits: 2),
        tax: 1.25
    )
end