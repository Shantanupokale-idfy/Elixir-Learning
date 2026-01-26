defmodule ShopWeb.ProductController do
  use ShopWeb , :controller


@product [
  %{id: "1" , name: "god of war"},
  %{id: "2" , name: "bayblade"},
  %{id: "3" , name: "gta5"}
]

  def index(conn , _params) do
    conn
    |> assign(:products , @product)
    |> render(:index )
  end

  def show(conn, %{"id" => id}) do
    product = Enum.find(@product , fn product -> product.id == id end)
    conn
    |> assign(:product ,product)
    |> render( :show  )
  end

end
