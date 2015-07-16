class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.text :address1
      t.text :address2
      t.text :address3
      t.text :country
      t.text :city
      t.text :state
      t.text :zip
      t.text :taxes
      t.text :rent
      t.text :notes

      t.timestamps null: false
    end
  end
end
