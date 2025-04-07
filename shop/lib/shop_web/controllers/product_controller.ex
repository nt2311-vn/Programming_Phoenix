defmodule ShopWeb.ProductController do
  use ShopWeb, :controller

  alias Shop.{Repo, Product}

  def index(conn, _params) do
    products = Repo.all(Product)

    conn
    |> assign(:products, products)
    |> render(:index)
  end

  def show(conn, %{"id" => id}) do
    product = Repo.get(Product, id)

    conn
    |> assign(:product, product)
    |> render(:show)
  end
end
