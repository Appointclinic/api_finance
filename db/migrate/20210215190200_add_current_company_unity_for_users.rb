class AddCurrentCompanyUnityForUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :current_unity_id, :bigint
  end
end
