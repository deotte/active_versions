class AddNameToCustomer < ActiveRecord::Migration[7.0]
  def up
    add_column :customers, :name, :string
    add_column :customer_versions, :name, :string
  end

  def down
    remove_column :customers, :name
    remove_column :customer_versions, :name
  end
end
