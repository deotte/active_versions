class Customer < ApplicationRecord
  include ActiveVersions

  has_many :customer_versions, dependent: :destroy

  NON_VERSIONED_ATTRIBUTES = %w[name language].freeze

  SUPPORT_LEVELS = %w[free pro enterprise].freeze
  RATINGS = %w[aaa aa a b].freeze
  BILLING_STRATEGIES = %w[yearly quarterly biweekly].freeze
  BILLING_PROVIDERS = %w[square braintree visa].freeze

  validates :support_level, inclusion: { in: SUPPORT_LEVELS }, if: -> { !in_setup }
  validates :rating, inclusion: { in: RATINGS }, if: -> { !in_setup }
  validates :billing_strategy, inclusion: { in: BILLING_STRATEGIES }, if: -> { !in_setup }
  validates :billing_provider, inclusion: { in: BILLING_PROVIDERS }, if: -> { !in_setup }

  after_commit -> { create_versioned_record(self) }, if: :persisted?, on: [:update]
end
