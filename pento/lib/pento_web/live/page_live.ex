defmodule PentoWeb.PageLive do
  use PentoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :message, "Welcome to Liveview!")}
  end
end
