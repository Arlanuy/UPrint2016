class AddNumberPagesToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :number_pages, :integer
  end
end
