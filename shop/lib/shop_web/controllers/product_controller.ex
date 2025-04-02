defmodule ShopWeb.ProductController do
  use ShopWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
