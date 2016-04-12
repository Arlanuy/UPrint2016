class AddFileColumnsToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :paper_size, :string
    add_column :transactions, :color_settings, :string
    add_column :transactions, :additional_specs, :text
  end
end
