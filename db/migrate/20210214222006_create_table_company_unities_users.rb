class CreateTableCompanyUnitiesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :table_company_unities_users do |t|
      t.bigint :company_unity_id
      t.bigint :user_id
    end
  end
end
