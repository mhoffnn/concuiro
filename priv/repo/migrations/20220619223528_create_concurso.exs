defmodule Sorteio.Repo.Migrations.CreateConcurso do
  use Ecto.Migration

  def change do
    create table(:concurso) do
      add :nome, :string
      add :receita, :string
      add :data, :time

      timestamps()
    end
  end
end
