Spree::Product.class_eval do

attr_accessible :manufacturer if Spree::Product.table_exists? && Spree::Product.column_names.include?('manufacturer')


end