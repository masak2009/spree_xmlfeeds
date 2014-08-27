class AddHeurekaczCustomTaxon < ActiveRecord::Migration
  def change
    add_column :spree_products, :heurekacz_custom_taxon, :text
  end
end
