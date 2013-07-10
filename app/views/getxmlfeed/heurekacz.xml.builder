xml.instruct!
xml.SHOP do
  @products.each do |product|
    xml.SHOPITEM do
      xml.ITEM_ID "SKUID"+product.id.to_s
      xml.PRODUCTNAME product.name
      xml.PRODUCT product.name
      xml.MANUFACTURER product.manufacturer
      product_description = product.description
      unless product.product_properties.empty?
      for product_property in product.product_properties
        product_description << "<h4>" + product_property.property.presentation + "</h4>"
        product_description <<  product_property.value
      end
      end
      xml.DESCRIPTION product_description
      if product.taxons != []
        breadcrumbs = []
        breadcrumbs = breadcrumbs + product.taxons.try(:first).try(:ancestors).collect {|ancs| ancs.name}
        breadcrumbs = breadcrumbs + [product.taxons.try(:first).try(:name)]
        breadcrumbs = breadcrumbs.join(" | ")
      else
        breadcrumbs = "nespecifikováno"
      end
      #pro spravne fungovani musi byt taxony z Spree, sparovany s taxony z heureky => toto neni implementovano
      xml.CATEGORYTEXT breadcrumbs
      xml.URL "http://" + request.env["HTTP_HOST"] + "/products/" + product.permalink
      if Spree::Image.find_by_viewable_id(product.master.id)
        xml.IMGURL "http://" + request.env["HTTP_HOST"] + "/spree/products/"+ Spree::Image.find_by_viewable_id(product.master.id).id.to_s + "/product/" + Spree::Image.find_by_viewable_id(product.master.id).attachment_file_name
      else
        xml.IMGURL        
      end
      if Spree::Config[:price_with_vat]
        xml.PRICE round_price(product)
        xml.PRICE_VAT product.price 
      else
        #fix for indidual vat pre product 
        xml.PRICE product.price
        xml.PRICE_VAT (product.price * (1 + Spree::Config[:czech_vat])).to_f.round(2)
      end
      xml.HEUREKA_CPC 1
      xml.DELIVERY_DATE 0
    end
  end
end

