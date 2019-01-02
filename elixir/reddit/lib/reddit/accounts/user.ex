defmodule Reddit.Accounts.User do
  use Ecto.Schema

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :hashed_password, :string

    timestamps()
  end
end
