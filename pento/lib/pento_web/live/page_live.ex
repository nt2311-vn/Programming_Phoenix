defmodule PentoWeb.PageLive do
  use PentoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "BNB", result: %{})}
  end
end
