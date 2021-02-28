class CreateIncomings < ActiveRecord::Migration[6.0]
  def change
    create_table :incomings, id: :uuid do |t|
      t.belongs_to :cash_account, null: false, foreign_key: true
      t.uuid :parent_id
      t.string :client_name
      t.string :client_identification
      t.decimal :value
      t.text :observations
      t.string :description
      t.bigint :bank_account_id
      t.integer :kind
      t.boolean :split, default: false
      t.boolean :repeat, default: false
      t.integer :repeat_period
      t.integer :repeat_occurrency
      t.decimal :upfront_payment
      t.integer :split_quantity
      t.date :due_date
      t.boolean :paid, default: false
      t.date :paid_at

      t.timestamps
    end
  end
end
