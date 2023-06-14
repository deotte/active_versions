class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.column :support_level, :integer, default: 0
      t.column :rating, :integer, default: 0
      t.column :billing_strategy, :integer, default: 0
      t.column :billing_provider, :integer, default: 0
      t.column :currency, :string
      t.column :language, :string
      t.column :two_fa_active, :boolean
      t.column :sso_active, :boolean
      t.column :promo_code, :string
      t.column :primary_contact, :string
      t.timestamps
    end
  end
end
