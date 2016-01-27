class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string  :shop_name
      t.string  :location
      t.string   :email

      t.timestamps null: false
    end
  end
end
