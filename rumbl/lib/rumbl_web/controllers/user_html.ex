defmodule RumblWeb.UserHTML do
  use RumblWeb, :html
  embed_templates("user_html/*")

  @doc """
  Render each user template
  """
  def user_show(assigns) do
    ~H"""
      <h1>User Profile</h1>
      <p>Name: <strong><%= @user.name %></strong></p>
      <p>Nickname: <%= @user.username %></p>
    """
  end
end
