# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def random_phone_number
    Random.rand(100_000_0000..1000_000_0000-1)
end

def random_cook_time
    Random.rand(10..60)
end

# Destroy all previous records
User.destroy_all
Owner.destroy_all
Customer.destroy_all
Restaurant.destroy_all

# Seed owners
10.times do |index|
    user = User.create(
        username:   "owner#{ index }",
        password:   "owner#{ index }",
        user_type:  "owner"
    )
    owner = Owner.create(
        user_id:        user.id,
        full_name:      "Owner#{ index }",
        phone_number:   random_phone_number,
        email:          "owner#{ index }@gmail.com"
    )
    # Seed restaurants
    3.times do |t|
        Restaurant.create(
            owner_id:               owner.id,
            name:                   "#{ owner.full_name }\'s restaurant#{ t }",
            estimated_cook_time:    random_cook_time,
        )
    end
end
p "Created #{ Owner.count } owners."
p "Created #{ Restaurant.count } restaurants."

# Seed customers
10.times do |index|
    user = User.create(
        username:   "customer#{ index }",
        password:   "customer#{ index }",
        user_type:  "customer"
    )
    Customer.create(
        user_id:        user.id,
        full_name:      "Customer#{ index }",
        phone_number:   random_phone_number,
        email:          "customer#{ index }@gmail.com"
    )
end
p "Created #{ Customer.count } customers."
