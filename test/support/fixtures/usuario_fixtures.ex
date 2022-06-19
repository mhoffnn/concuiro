defmodule Sorteio.UsuarioFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sorteio.Usuario` context.
  """

  @doc """
  Generate a usuarios.
  """
  def usuarios_fixture(attrs \\ %{}) do
    {:ok, usuarios} =
      attrs
      |> Enum.into(%{
        email: "some email",
        nome: "some nome",
        senha: "7488a646-e31f-11e4-aace-600308960662",
        telefone: "some telefone"
      })
      |> Sorteio.Usuario.create_usuarios()

    usuarios
  end
end
