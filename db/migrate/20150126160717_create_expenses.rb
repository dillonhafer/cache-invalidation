class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.references :department
      t.references :location
      t.timestamps null: false
    end
  end
end
