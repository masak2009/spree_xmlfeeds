class AddManufacturerToProduct < ActiveRecord::Migration
  def change
    add_column :spree_products, :manufacturer ,:string
  end
end
