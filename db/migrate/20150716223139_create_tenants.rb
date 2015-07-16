class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.text :name
      t.text :work_phone
      t.text :mobile_phone
      t.text :home_phone
      t.text :email
      t.text :birthday
      t.references :property, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
