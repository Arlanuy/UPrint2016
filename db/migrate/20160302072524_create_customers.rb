class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
    	t.string  :lastname,       null: false
      t.string  :firstname,      null: false
      t.string  :email,          null: false
      t.string  :contact_number
      t.integer :is_admin

      t.timestamps null: false
    end
  end
end
