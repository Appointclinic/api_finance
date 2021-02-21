class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :street
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :country, default: 'BR'
      t.string :number
      t.string :complement
      t.string :postal_code
      t.bigint :company_id
      t.belongs_to :user, type: :uuid, null: true, foreign_key: true

      t.timestamps
    end
  end
end
