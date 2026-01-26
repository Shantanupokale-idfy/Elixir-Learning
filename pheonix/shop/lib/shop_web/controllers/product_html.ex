defmodule ShopWeb.ProductHTML do
  use ShopWeb, :html

  embed_templates "product_html/*"



  #definig component just like we use to define in react now we can reuse it anywhere
  def product(assigns) do
    ~H"""
      <p> Product Component Game : <%= assigns.name %> </p>
    """
  end
end
