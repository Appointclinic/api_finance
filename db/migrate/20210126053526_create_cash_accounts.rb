class CreateCashAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :cash_accounts do |t|
      t.belongs_to :company_unity, null: false, foreign_key: true
      t.date :enclosing
      t.string :responsible
      t.decimal :total_registered

      t.timestamps
    end
  end
end
