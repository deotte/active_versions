class Customer < ApplicationRecord
  include ActiveVersions

  # enum support_level: { blank: 0, free: 1, pro: 2, enterprise: 3 }
  # enum rating: { blank: 0, b: 1, a: 2, aa: 3, aaa: 4 }
  # enum billing_strategy: { blank: 0, yearly: 1, quarterly: 2, weekly: 3 }
  # enum billing_provider: { blank: 0, square: 1, braintree: 2 }

  has_many :customer_versions, dependent: :destroy

  after_commit -> { create_versioned_record(self) }, if: :persisted?, on: [:update]
end
