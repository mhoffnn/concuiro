defmodule Sorteio.Repo.Migrations.CreateUsuario do
  use Ecto.Migration

  def change do
    create table(:usuario) do
      add :nome, :string
      add :senha, :uuid
      add :email, :string
      add :telefone, :string

      timestamps()
    end
  end
end
