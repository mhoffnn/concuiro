defmodule Sorteio.Usuario.Usuarios do
  use Ecto.Schema
  import Ecto.Changeset

  schema "usuario" do
    field :email, :string
    field :nome, :string
    field :senha, Ecto.UUID
    field :telefone, :string

    timestamps()
  end

  @doc false
  def changeset(usuarios, attrs) do
    usuarios
    |> cast(attrs, [:nome, :senha, :email, :telefone])
    |> validate_required([:nome, :senha, :email, :telefone])
  end
end
