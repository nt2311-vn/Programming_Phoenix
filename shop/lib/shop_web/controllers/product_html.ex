defmodule ShopWeb.ProductHTML do
  use ShopWeb, :html

  embed_templates("product_html/*")

  attr(:name, :string, required: true)
  attr(:id, :string, required: true)

  def product(assigns) do
    ~H"""
    <h1>Game {@name}</h1>
    <p>Product id {@id}</p>
    """
  end
end
