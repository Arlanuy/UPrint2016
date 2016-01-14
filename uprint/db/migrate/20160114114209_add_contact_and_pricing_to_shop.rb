class AddContactAndPricingToShop < ActiveRecord::Migration
  def change
    add_column :shops, :contact_number, :string
    add_column :shops, :pricing, :text
  end
end
