defmodule ShopWeb.RandomHTML do
  use ShopWeb, :html

  def random(assigns) do
    ~H"""
    <h1>This is the random page</h1>
    """
  end
end
