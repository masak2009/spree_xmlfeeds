class AddEanToProduct < ActiveRecord::Migration
  def change
    add_column :spree_products, :ean, :text    
  end
end
