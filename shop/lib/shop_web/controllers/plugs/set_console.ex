defmodule ShopWeb.Plugs.SetConsole do
  import Plug.Conn

  def init(default_console), do: default_console

  def call(
        %Plug.Conn{
          :params => %{
            "console" => console
          }
        } = conn,
        _opts
      ) do
    conn
    |> assign(:console, console)
    |> put_resp_cookie("console", console, max_age: :timer.hours(24) * 30)
  end

  def call(%Plug.Conn{} = conn, default_console) do
    conn |> assign(:console, default_console)
  end
end
