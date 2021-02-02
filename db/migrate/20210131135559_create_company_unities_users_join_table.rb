class CreateCompanyUnitiesUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :company_unities_users, id: false do |t|
      t.bigint :user_id
      t.bigint :company_unity_id
    end

    add_index :company_unities_users, :user_id
    add_index :company_unities_users, :company_unity_id
  end
end