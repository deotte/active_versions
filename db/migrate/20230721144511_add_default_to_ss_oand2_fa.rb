class AddDefaultToSsOand2Fa < ActiveRecord::Migration[7.0]
  def up
    change_column :customers, :two_fa_active, :boolean, default: false
    change_column :customers, :sso_active, :boolean, default: false
  end

  def down
    change_column :customers, :two_fa_active, :boolean, default: nil
    change_column :customers, :sso_active, :boolean, default: nil
  end
end
