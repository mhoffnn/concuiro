defmodule Sorteio.InscricaoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sorteio.Inscricao` context.
  """

  @doc """
  Generate a inscricoes.
  """
  def inscricoes_fixture(attrs \\ %{}) do
    {:ok, inscricoes} =
      attrs
      |> Enum.into(%{
        descricao: "some descricao",
        votos: 42
      })
      |> Sorteio.Inscricao.create_inscricoes()

    inscricoes
  end
end
