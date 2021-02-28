class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :country, default: 'BR'
      t.string :number
      t.string :complement
      t.string :postal_code
      t.bigint :company_id
      t.belongs_to :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
