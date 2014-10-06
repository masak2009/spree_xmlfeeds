class AddZboziczSearchCpc < ActiveRecord::Migration
  def up
    add_column :spree_products, :zbozicz_search_cpc, :float
  end

  def down
    remove_column :spree_products, :zbozicz_search_cpc
  end
end
