Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  scope "/getxmlfeed", :controller => "getxmlfeed" do
    get "/zbozicz", :action => :zbozicz
    get "/heurekacz", :action => :heurekacz
    get "/monitorcz", :action => :monitorcz
    get "/hledejceny", :action => :hledejceny
    get "/naakupcz", :action => :naakupcz
    get "/jyxocz", :action => :jyxocz
  end
end
