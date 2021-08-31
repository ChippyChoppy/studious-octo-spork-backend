# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "deleting old"
Customer.destroy_all
OrderItem.destroy_all
Item.destroy_all
puts "seeding faker"



10.times do 
    customer = Customer.create!(
        name: Faker::FunnyName.name,
        email: Faker::Internet.email,
        active: Faker::Boolean.boolean
    )
    5.times do
        Order.create!(
            order_date: Faker::Date.between(from: 365.days.ago, to: Date.today),
            total: Faker::Number.decimal(l_digits: 3, r_digits: 2)
        )
        5.times do
            OrderItem.create!(
                item_id: Faker::Number.within(range 101..568),
                quantity: Faker::Number.within(range 1..10),        
                price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
                tax: price * 0.08875
            )
        end
    end
end


