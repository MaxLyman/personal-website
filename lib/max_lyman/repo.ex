defmodule MaxLyman.Repo do
  use Ecto.Repo,
    otp_app: :max_lyman,
    adapter: Ecto.Adapters.Postgres
end
