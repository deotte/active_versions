class ChangeDefaultValuesOnCustomerColumns < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:customers, :support_level, '')
    change_column_default(:customers, :rating, '')
    change_column_default(:customers, :billing_strategy, '')
    change_column_default(:customers, :billing_provider, '')

    change_column_default(:customer_versions, :support_level, '')
    change_column_default(:customer_versions, :rating, '')
    change_column_default(:customer_versions, :billing_strategy, '')
    change_column_default(:customer_versions, :billing_provider, '')
  end
end
