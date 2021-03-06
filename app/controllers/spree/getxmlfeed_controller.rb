module Spree
class GetxmlfeedController < Spree::BaseController

  #get XML feed for zbozi.cz
  #require gem "builder" for working
  #RAILS 3 URL => /getxmlfeed/zbozicz.xml
  def zbozicz
    @xml = Builder::XmlMarkup.new
    #@products = Spree::Product.find_all_by_deleted_at(nil,:conditions => ["available_on < ?",Time.now])
     if Rails.env.development?
      @products = Spree::Product.where(:deleted_at => nil).where("available_on < ?",Time.now).limit(100)
     else
      @products = Spree::Product.where(:deleted_at => nil).where("available_on < ?",Time.now)
     end
    respond_to do |format|
      format.xml # index.xml.builder
    end
  end

  def hledejceny
    @xml = Builder::XmlMarkup.new
    @products = Spree::Product.find_all_by_deleted_at(nil,:conditions => ["available_on < ?",Time.now])
    respond_to do |format|
      format.xml # index.xml.builder
    end
  end

  def monitorcz
    @xml = Builder::XmlMarkup.new
    @products = Spree::Product.find_all_by_deleted_at(nil,:conditions => ["available_on < ?",Time.now])
    respond_to do |format|
      format.xml # index.xml.builder
    end
  end

  def naakupcz
    @xml = Builder::XmlMarkup.new
    @products = Spree::Product.find_all_by_deleted_at(nil,:conditions => ["available_on < ?",Time.now])
    respond_to do |format|
      format.xml {render :action => :zbozicz }
    end
  end

  def heurekacz
    @xml = Builder::XmlMarkup.new
    @products = Spree::Product.find_all_by_deleted_at(nil,:conditions => ["available_on < ?",Time.now])
    respond_to do |format|
      format.xml # index.xml.builder
    end
  end

  def jyxocz
    @xml = Builder::XmlMarkup.new
    @products = Spree::Product.find_all_by_deleted_at(nil,:conditions => ["available_on < ?",Time.now])
    respond_to do |format|
      format.xml # index.xml.builder
    end
  end
end
end
