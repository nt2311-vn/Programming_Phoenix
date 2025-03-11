defmodule Rumbl.Accounts do
  alias Rumbl.Accounts.User

  @users [
    %User{id: "1", name: "José", username: "josevalim", password: "elixir"},
    %User{id: "2", name: "Bruce", username: "redrapids", password: "7langs"},
    %User{id: "3", name: "Chris", username: "chrismccord", password: "phx"}
  ]

  @doc """
  Return all users
  """
  def list_users, do: @users

  @doc """
  Find a user by Id
  """
  def get_user(id), do: list_users() |> Enum.find(&(&1.id == id))

  @doc """
  Find user by arbitrary parameters
  """
  def get_by(params) do
    list_users()
    |> Enum.find(fn user -> Enum.all?(params, fn {key, val} -> Map.get(user, key) == val end) end)
  end
end
