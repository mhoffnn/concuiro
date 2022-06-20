defmodule Sorteio.Repo.Migrations.CreateInscricao do
  use Ecto.Migration

  def change do
    create table(:inscricao) do
      add :votos, :integer
      add :descricao, :string
      add :id_concurso, references(:concurso, on_delete: :nothing)
      add :id_usuario, references(:usuario, on_delete: :nothing)

      timestamps()
    end

    create index(:inscricao, [:id_concurso])
    create index(:inscricao, [:id_usuario])
  end
end
