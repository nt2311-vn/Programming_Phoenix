defmodule ShopWeb.ProductHTML do
  use ShopWeb, :html

  embed_templates("product_html/*")

  def product(assigns) do
    ~H"""
    <h1>Game <%= assigns.name %></h1>
    <p>Product id <%= assigns.id %></p>
    """
  end
end
