defmodule MyPortfolio.Repo do
  use Ecto.Repo,
    otp_app: :my_portfolio,
    adapter: Ecto.Adapters.Postgres
end
