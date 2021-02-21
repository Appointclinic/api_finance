class CreateCompanyUnities < ActiveRecord::Migration[6.0]
  def change
    create_table :company_unities, id: :uuid do |t|
      t.string :name
      t.belongs_to :company, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
