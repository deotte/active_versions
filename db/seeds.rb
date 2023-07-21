puts "Seeding customers..."
load File.join(Rails.root, "db", "seeds", "customers.rb")

puts "Seeding customer versions..."
load File.join(Rails.root, "db", "seeds", "customer_versions.rb")
