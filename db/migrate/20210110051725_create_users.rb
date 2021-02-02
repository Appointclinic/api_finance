class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :social_security_number
      t.integer :role
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
