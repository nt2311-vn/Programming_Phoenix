defmodule ShopWeb.ProductHTML do
  use ShopWeb, :html

  alias Shop.Product

  embed_templates("product_html/*")

  attr(:product, Product, required: true)

  def product(assigns) do
    ~H"""
    <h1>Game {@product.name}</h1>
    <p>Product id {@product.id}</p>
    <p>Game slug {@product.slug}</p>
    """
  end
end
