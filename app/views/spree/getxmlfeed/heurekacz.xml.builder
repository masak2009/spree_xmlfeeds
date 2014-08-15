xml.instruct!
xml.SHOP do
  @products.each do |product|
    xml.SHOPITEM do
      if product.zbozicz_product_name.present?
        xml.PRODUCTNAME "#{product.manufacturer.try(:capitalize)} #{product.zbozicz_product_name}"
        xml.PRODUCT "#{product.manufacturer.try(:capitalize)} #{product.zbozicz_product_name}"
      else
        xml.PRODUCTNAME "#{product.manufacturer.try(:capitalize)} #{product.name}"
        xml.PRODUCT "#{product.manufacturer.try(:capitalize)} #{product.name}"
      end
      xml.ITEM_ID "#{product.id}"
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
      xml.MANUFACTURER product.manufacturer
      xml.CATEGORYTEXT breadcrumbs_xml(Spree::Taxon.find_by_id(product.zbozicz_taxon_id)) if product.zbozicz_taxon_id

      if Spree::Image.find_by_viewable_id(product.master.id)
        xml.IMGURL "http://" + request.env["HTTP_HOST"] + "/spree/products/"+ Spree::Image.find_by_viewable_id(product.master.id).id.to_s + "/product/" + Spree::Image.find_by_viewable_id(product.master.id).attachment_file_name
      else
        xml.IMGURL        
      end

      vat_and_price = Spree::TaxRate.return_vat_and_price_without_vat(product.price)

      xml.PRICE_VAT vat_and_price[0]+vat_and_price[1]
      if product.zbozicz_max_cpc.present?
        xml.HEUREKA_CPC product.heurekacz_max_cpc
      else
        #xml.HEUREKA_CPC 1          
      end

      xml.DELIVERY_DATE 0      
    end
  end
end

