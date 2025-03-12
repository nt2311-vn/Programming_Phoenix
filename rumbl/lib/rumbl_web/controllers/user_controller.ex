defmodule RumblWeb.UserController do
  use RumblWeb, :controller
  alias Rumbl.Accounts
  alias Rumbl.Accounts.User

  @doc """
  Index view list all user
  """
  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, :index, users: users)
  end

  @doc """
  Show a specific user
  """
  def show(conn, %{"id" => id}) do
    user = Accounts.get_user(id)
    render(conn, :show, user: user)
  end

  @doc """
  Template form on creating/changing user
  """
  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, :user_create, changeset: changeset)
  end

  @doc """
  Action on creating/changing user
  """
  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully")
        |> redirect(to: ~p"/users/#{user.id}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end
end
