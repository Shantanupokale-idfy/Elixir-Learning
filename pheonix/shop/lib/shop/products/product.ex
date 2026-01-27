defmodule Shop.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :slug, :string
    field :console, Ecto.Enum, values: [:pc, :xbox, :nintendo, :playstation]

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :console])
    |> validate_required([:name, :console])
    |> validate_length(:name, min: 3)
    |> format_name()
    |> generate_slug()
    |> validate_required([:slug])
    |> unique_constraint(:slug)
  end

  defp format_name(%{changes: %{name: name}} = changeset) do
    put_change(changeset, :name, String.trim(name))
  end

  defp format_name(changeset), do: changeset

  defp generate_slug(%{changes: %{name: name}} = changeset) do
    slug =
      name
      |> String.downcase()
      |> String.replace(" ", "-")

    put_change(changeset, :slug, slug)
  end

  defp generate_slug(changeset), do: changeset
end
