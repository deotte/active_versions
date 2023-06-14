class Customer < ApplicationRecord
  enum support_level: { free: 0, pro: 1, enterprise: 2 }
  enum rating: { b: 0, a: 1, aa: 2, aaa: 3 }
  enum billing_strategy: { yearly: 0, quarterly: 1, weekly: 2 }
  enum billing_provider: { square: 0, braintree: 1 }

  has_many :customer_versions, dependent: :destroy
end
