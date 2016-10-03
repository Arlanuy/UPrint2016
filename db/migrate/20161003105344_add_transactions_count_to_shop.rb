class AddTransactionsCountToShop < ActiveRecord::Migration
  def change
    add_column :shops, :transactions_count, :integer
  end
end
