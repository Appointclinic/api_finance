class CreateCompanyUnities < ActiveRecord::Migration[6.0]
  def change
    create_table :company_unities do |t|
      t.string :name
      t.belongs_to :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
