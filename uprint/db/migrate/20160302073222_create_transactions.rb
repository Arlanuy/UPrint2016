class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
    	t.belongs_to :customer
      t.belongs_to :shop
      t.datetime :date_sent,       null:false
      t.datetime :date_downloaded
      t.datetime :date_paid
      t.float :price,              null:false

      t.timestamps null: false
    end
  end
end
