defmodule Rumbl.Accounts.User do
  use Ecto.Schema

  import Ecto.Changeset

  schema "users" do
    field(:name, :string)
    field(:username, :string)
    field(:password, :string, virtual: true)
    field(:password_hash, :string)

    timestamps()
  end

  @doc """
  Function for change/update user
  """
  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :username])
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 1, max: 20)
  end

  @doc """
  Function for register changeset
  """
  def registration_changeset(user, params) do
    user
    |> changeset(params)
    |> cast(params, [:password])
    |> validate_length(:password, min: 6, max: 20)
  end
end
