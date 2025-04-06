defmodule ShopWeb.RandomController do
  use ShopWeb, :controller

  def random(conn, _params) do
    conn |> render(:random)
  end
end
