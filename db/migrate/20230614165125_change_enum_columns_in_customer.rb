class ChangeEnumColumnsInCustomer < ActiveRecord::Migration[7.0]
  def up
    change_column :customers, :support_level, :string, limit: 40
    change_column :customers, :rating, :string, limit: 40
    change_column :customers, :billing_strategy, :string, limit: 40
    change_column :customers, :billing_provider, :string

    change_column :customer_versions, :support_level, :string, limit: 40
    change_column :customer_versions, :rating, :string, limit: 40 
    change_column :customer_versions, :billing_strategy, :string, limit: 40
    change_column :customer_versions, :billing_provider, :string
  end

  def down
    change_column :customers, :support_level, :integer, default: 0
    change_column :customers, :rating, :integer, default: 0
    change_column :customers, :billing_strategy, :integer, default: 0
    change_column :customers, :billing_provider, :integer, default: 0

    change_column :customer_versions, :support_level, :integer, default: 0
    change_column :customer_versions, :rating, :integer, default: 0
    change_column :customer_versions, :billing_strategy, :integer, default: 0
    change_column :customer_versions, :billing_provider, :integer, default: 0
  end
end
