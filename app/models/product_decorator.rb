Spree::Product.class_eval do

attr_accessible :manufacturer if Spree::Product.table_exists? && Spree::Product.column_names.include?('manufacturer')
attr_accessible :zbozicz_max_cpc if Spree::Product.table_exists? && Spree::Product.column_names.include?('zbozicz_max_cpc')
attr_accessible :zbozicz_product_name if Spree::Product.table_exists? && Spree::Product.column_names.include?('zbozicz_product_name')
attr_accessible :zbozicz_free_delivery if Spree::Product.table_exists? && Spree::Product.column_names.include?('zbozicz_free_delivery')
attr_accessible :zbozicz_taxon_id if Spree::Product.table_exists? && Spree::Product.column_names.include?('zbozicz_taxon_id')
attr_accessible :heurekacz_max_cpc if Spree::Product.table_exists? && Spree::Product.column_names.include?('heurekacz_max_cpc')
attr_accessible :heurekacz_custom_taxon if Spree::Product.table_exists? && Spree::Product.column_names.include?('heurekacz_custom_taxon')
attr_accessible :ean if Spree::Product.table_exists? && Spree::Product.column_names.include?('ean')
end