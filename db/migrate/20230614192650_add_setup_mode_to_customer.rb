class AddSetupModeToCustomer < ActiveRecord::Migration[7.0]
  def up
    add_column :customers, :in_setup, :boolean, default: true
    add_column :customer_versions, :in_setup, :boolean, default: true
  end

  def down
    remove_column :customers, :in_setup
    remove_column :customer_versions, :in_setup
  end
end
