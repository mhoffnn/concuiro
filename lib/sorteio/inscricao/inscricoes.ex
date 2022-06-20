defmodule Sorteio.Inscricao.Inscricoes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inscricao" do
    field :descricao, :string
    field :votos, :integer
    field :id_concurso, :id
    field :id_usuario, :id

    timestamps()
  end

  @doc false
  def changeset(inscricoes, attrs) do
    inscricoes
    |> cast(attrs, [:votos, :descricao])
    |> validate_required([:votos, :descricao])
  end
end
