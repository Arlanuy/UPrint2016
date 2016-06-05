class AddNumberCopiesToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :number_copies, :integer
  end
end
