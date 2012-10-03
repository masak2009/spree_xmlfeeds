xml.instruct! :xml, :version => "1.0", :encoding => "UTF-8"
xml.offers do
  @products.each do |product|
    xml.offer do
      xml.name product.name
      product_description = product.description
      unless product.product_properties.empty?
      for product_property in product.product_properties
        product_description << "<h4>" + product_property.property.presentation + "</h4>"
        product_description <<  product_property.value
      end
      end
      xml.DESCRIPTION product_description
      if  Spree::Config[:price_with_vat]
        xml.price_vat product.price
      else
        #using taxrates
      end
      xml.url "http://" + request.env["HTTP_HOST"] + "/products/" + product.permalink
      if Spree::Image.find_by_viewable_id(product.master.id)
        xml.IMGURL "http://" + request.env["HTTP_HOST"] + "/spree/products/"+ Spree::Image.find_by_viewable_id(product.master.id).id.to_s + "/product/" + Spree::Image.find_by_viewable_id(product.master.id).attachment_file_name
      else
        xml.IMGURL        
      end
      xml.category product.taxons.first.name
    end
  end
end


