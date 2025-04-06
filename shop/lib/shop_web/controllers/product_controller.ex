defmodule ShopWeb.ProductController do
  use ShopWeb, :controller

  @products [
    %{id: "1", name: "God of war"},
    %{id: "2", name: "Skyrim"},
    %{id: "3", name: "Diablo 4"}
  ]

  def index(conn, _params) do
    conn
    |> assign(:products, @products)
    |> render(:index)
  end

  def show(conn, %{"id" => id}) do
    product = Enum.find(@products, &(&1.id == id))

    conn
    |> assign(:product, product)
    |> render(:show)
  end
end
