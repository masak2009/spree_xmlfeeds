xml.instruct!
xml.SHOP do
  @products.each do |product|
    xml.SHOPITEM do
      if product.zbozicz_product_name.present?
        xml.PRODUCTNAME product.zbozicz_product_name
      else
        xml.PRODUCTNAME product.name
      end
      product_description = product.description
      unless product.product_properties.empty?
      for product_property in product.product_properties
        product_description << "<h4>" + product_property.property.presentation + "</h4>"
        product_description <<  product_property.value
      end
      end
      xml.DESCRIPTION product_description
      xml.URL "http://" + request.env["HTTP_HOST"] + "/products/" + product.permalink
      
      #xml.AVAILABILITY 0
      xml.DELIVERY_DATE 0
      xml.MANUFACTURER product.manufacturer
      xml.CATEGORYTEXT breadcrumbs_xml(Spree::Taxon.find_by_id(product.zbozicz_taxon_id)) if product.zbozicz_taxon_id
      
      if Spree::Image.find_by_viewable_id(product.master.id)
        xml.IMGURL "http://" + request.env["HTTP_HOST"] + "/spree/products/"+ Spree::Image.find_by_viewable_id(product.master.id).id.to_s + "/product/" + Spree::Image.find_by_viewable_id(product.master.id).attachment_file_name
      else
        xml.IMGURL        
      end
      vat_and_price = Spree::TaxRate.return_vat_and_price_without_vat(product.price)
      xml.PRICE vat_and_price[0].round(2)
      xml.PRICE_VAT vat_and_price[0]+vat_and_price[1]
      if product.zbozicz_max_cpc.present?
        xml.MAX_CPC product.zbozicz_max_cpc
      else
        xml.MAX_CPC 1          
      end
      xml.FIRMY_CZ 0
      if product.zbozicz_free_delivery == 1
        xml.EXTRA_MESSAGE "free_delivery"
      end
      xml.EAN product.ean
    end
  end
end
