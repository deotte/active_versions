module CustomerValidations
  extend ActiveSupport::Concern
  SUPPORT_LEVELS = %w[Free Pro Enterprise].freeze

  included do
    # validates :support_level, inclusion: { in: SUPPORT_LEVELS }
  end
end