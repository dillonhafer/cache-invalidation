class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.references :department
      t.references :location
      t.timestamps null: false
    end
  end
end
