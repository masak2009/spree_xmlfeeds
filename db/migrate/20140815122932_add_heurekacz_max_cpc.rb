class AddHeurekaczMaxCpc < ActiveRecord::Migration
  def change
    add_column :spree_products, :heurekacz_max_cpc, :float
  end
end
