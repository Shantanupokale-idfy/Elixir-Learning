defmodule Shop.Products do
  alias Shop.Repo
  alias Shop.Products.Product
  #this is the context whill will call the Repo as we should not run queries directly calling Repo.get()

  def list_product , do: Repo.all(Product)

  def find_product_by_slug(slug) when is_binary(slug) do
    Repo.get_by(Product, slug: slug)
  end
end
