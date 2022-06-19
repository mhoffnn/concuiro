defmodule Sorteio.ConcursoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sorteio.Concurso` context.
  """

  @doc """
  Generate a concursos.
  """
  def concursos_fixture(attrs \\ %{}) do
    {:ok, concursos} =
      attrs
      |> Enum.into(%{
        data: ~T[14:00:00],
        nome: "some nome",
        receita: "some receita"
      })
      |> Sorteio.Concurso.create_concursos()

    concursos
  end
end
