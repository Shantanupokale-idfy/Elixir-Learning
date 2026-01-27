defmodule ShopWeb.ProductHTML do
  use ShopWeb, :html

  alias Shop.Products.Product
  embed_templates "product_html/*"

  attr :product , Product , required: true

  #definig component just like we use to define in react now we can reuse it anywhere
  def product(assigns) do
    ~H"""
<.link href={~p"/products/#{@product.slug}"} class="block" > { @product.name } </.link>
    """
  end
end
