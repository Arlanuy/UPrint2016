class AddPriceToShops < ActiveRecord::Migration
  def change
    add_column :shops, :price_blwt, :float
    add_column :shops, :price_grey, :float
    add_column :shops, :price_colr, :float
    remove_column :shops, :pricing, :text
  end
end
