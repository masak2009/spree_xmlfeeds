module Spree::GetxmlfeedHelper

  def round_price(product)
    (product.price / (1 + Spree::Config[:czech_vat])).round(2)
  end

  def breadcrumbs_xml(taxon, separator=" | ")
    return "" if current_page?("/")
    separator = raw(separator)
    crumbs = []
    if taxon
      crumbs << taxon.ancestors.collect { |ancestor| ancestor.name + separator } unless taxon.ancestors.empty?
      crumbs << taxon.name
    else
      crumbs << t('products')
    end
    crumb_list = crumbs.flatten
    #crumb_list = content_tag(:ul, raw(crumbs.flatten.map{|li| li.mb_chars}.join))
    #content_tag(:div, crumb_list + tag(:br, {:class => 'clear'}, false, true), :class => 'breadcrumbs')
  end


end

