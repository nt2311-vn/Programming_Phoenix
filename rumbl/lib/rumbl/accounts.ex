defmodule Rumbl.Accounts do
  alias Rumbl.Accounts.User
  alias Rumbl.Repo

  @doc """
  Return all users
  """
  def list_users, do: Repo.all(User)

  @doc """
  Find a user by Id
  """
  def get_user(id), do: Repo.get(User, id)

  @doc """
  Find user by arbitrary parameters
  """
  def get_by(params), do: Repo.get_by(User, params)
end
