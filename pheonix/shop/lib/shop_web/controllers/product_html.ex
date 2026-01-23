defmodule ShopWeb.ProductHTML do
  use ShopWeb, :html


  def index(assigns ) do
    ~H"""
    <h1> This is the products page </h1>
    """
  end
end
