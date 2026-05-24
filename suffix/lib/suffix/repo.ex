defmodule Suffix.Repo do
  use Ecto.Repo,
    otp_app: :suffix,
    adapter: Ecto.Adapters.SQLite3
end
