class AddPricePerPageToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :price_per_page, :float
  end
end
