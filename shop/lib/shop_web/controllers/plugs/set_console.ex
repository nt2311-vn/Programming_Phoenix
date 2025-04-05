defmodule ShopWeb.Plugs.SetConsole do
  def init(opts), do: opts

  def call(%Plug.Conn{} = conn, opts) do
    IO.inspect("Module plug is working")
    IO.inspect("Opts: " <> opts)
    conn
  end
end
