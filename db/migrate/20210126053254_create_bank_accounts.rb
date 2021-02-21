class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts, id: :uuid do |t|
      t.string :name
      t.decimal :initial_value
      t.references :company_unity, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
