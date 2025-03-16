defmodule HelloSocketsWeb.UserSocket do
  use Phoenix.Socket

  channel("ping:*", HelloSocketsWeb.PingChanel)

  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  def id(_params), do: nil
end
