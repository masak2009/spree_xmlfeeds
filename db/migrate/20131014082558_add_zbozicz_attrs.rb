class AddZboziczAttrs < ActiveRecord::Migration
  def up
    add_column :spree_products, :zbozicz_max_cpc, :float
    add_column :spree_products, :zbozicz_product_name, :string
    add_column :spree_products, :zbozicz_free_delivery, :integer
    add_column :spree_products, :zbozicz_taxon_id, :integer    
  end

  def down
    remove_column :spree_products, :zbozicz_max_cpc
    remove_column :spree_products, :zbozicz_product_name
    remove_column :spree_products, :zbozicz_free_delivery
    remove_column :spree_products, :zbozicz_taxon_id    
  end
end
