class AddDatePrintedToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :date_printed, :datetime
  end
end
