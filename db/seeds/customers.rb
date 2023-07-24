require 'faker'

Customer.destroy_all
puts "Destroyed all customers"

CUSTOMER_NAMES = [
  "Caspian Corporation",
  "Phantom Incorporated",
  "Rogue Limited",
  "Built by Otters",
  "Crazy Coffee Company",
  "Bigsby Bread Company",
  "Skywalker Sneakers",
  "Bartlebee Books",
  "Clives Clementines",
  "Sams Skateboards",
  "Apricots by Ambrose",
  "Leonards Limes",
].freeze

CUSTOMER_NAMES.each do |customer_name|
  new_customer = Customer.new
  new_customer[:name] = customer_name
  new_customer[:promo_code] = Faker::Commerce.promotion_code
  new_customer[:currency] = Faker::Currency.code
  new_customer[:primary_contact] = Faker::Internet.email(domain: "#{customer_name}.com")
  new_customer[:two_fa_active] = Faker::Boolean.boolean
  new_customer[:language] = Faker::Nation.language

  if !new_customer.save
    puts new_customer.errors.full_messages
  end
end

puts "New customers created"