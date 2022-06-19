defmodule Sorteio.Concurso.Concursos do
  use Ecto.Schema
  import Ecto.Changeset

  schema "concurso" do
    field :data, :string
    field :nome, :string
    field :receita, :string

    timestamps()
  end

  @doc false
  def changeset(concursos, attrs) do
    concursos
    |> cast(attrs, [:nome, :receita, :data])
    |> validate_required([:nome, :receita, :data])
  end
end
