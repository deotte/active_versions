require 'Faker'

CustomerVersion.destroy_all
puts "Destroyed all customer versions"

customer = Customer.find_by(name: "Caspian Corporation")
puts "Found Caspian Corporation"

3.times do |i|
  new_version = customer.customer_versions.new

  new_version[:support_level] = Customer::SUPPORT_LEVELS.sample
  new_version[:rating] = Customer::RATINGS.sample
  new_version[:primary_contact] = Faker::Internet.email(domain: "#{customer.name}.com")
  new_version[:promo_code] = Faker::Commerce.promotion_code
  new_version[:currency] = Faker::Currency.code

  if !new_version.save
    puts new_version.errors.full_messages
  end

  # All versions being created on the same day doesn't look as realistic
  if i == 0
    new_version.update_column(:created_at, Faker::Date.between(from: 2.days.ago, to: Date.today))
  elsif i == 1
    new_version.update_column(:created_at, Faker::Date.between(from: 3.days.ago, to: 7.days.ago))
  elsif i == 2
    new_version.update_column(:created_at, Faker::Date.between(from: 7.days.ago, to: 30.days.ago))
  end

  # Match the customer to their most recent versioned record
  if (i == 0)
    customer.update_columns(
      support_level: new_version.support_level,
      rating: new_version.rating,
      primary_contact: new_version.primary_contact,
      promo_code: new_version.promo_code,
      currency: new_version.currency
    )
  end
end

puts "Created new customer versions"