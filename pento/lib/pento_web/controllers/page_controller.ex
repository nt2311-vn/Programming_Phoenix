defmodule PentoWeb.PageController do
  use PentoWeb, :controller

  plug(:redirect_if_authenticated when action in [:home])

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  defp redirect_if_authenticated(conn, _opts) do
    if conn.assigns[:current_user] do
      conn |> redirect(to: "/guess") |> halt()
    else
      conn
    end
  end
end
