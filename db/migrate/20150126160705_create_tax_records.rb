class CreateTaxRecords < ActiveRecord::Migration
  def change
    create_table :tax_records do |t|
      t.string :name
      t.references :department
      t.timestamps null: false
    end
  end
end
