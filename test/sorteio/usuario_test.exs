defmodule Sorteio.UsuarioTest do
  use Sorteio.DataCase

  alias Sorteio.Usuario

  describe "usuario" do
    alias Sorteio.Usuario.Usuarios

    import Sorteio.UsuarioFixtures

    @invalid_attrs %{email: nil, nome: nil, senha: nil, telefone: nil}

    test "list_usuario/0 returns all usuario" do
      usuarios = usuarios_fixture()
      assert Usuario.list_usuario() == [usuarios]
    end

    test "get_usuarios!/1 returns the usuarios with given id" do
      usuarios = usuarios_fixture()
      assert Usuario.get_usuarios!(usuarios.id) == usuarios
    end

    test "create_usuarios/1 with valid data creates a usuarios" do
      valid_attrs = %{email: "some email", nome: "some nome", senha: "7488a646-e31f-11e4-aace-600308960662", telefone: "some telefone"}

      assert {:ok, %Usuarios{} = usuarios} = Usuario.create_usuarios(valid_attrs)
      assert usuarios.email == "some email"
      assert usuarios.nome == "some nome"
      assert usuarios.senha == "7488a646-e31f-11e4-aace-600308960662"
      assert usuarios.telefone == "some telefone"
    end

    test "create_usuarios/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usuario.create_usuarios(@invalid_attrs)
    end

    test "update_usuarios/2 with valid data updates the usuarios" do
      usuarios = usuarios_fixture()
      update_attrs = %{email: "some updated email", nome: "some updated nome", senha: "7488a646-e31f-11e4-aace-600308960668", telefone: "some updated telefone"}

      assert {:ok, %Usuarios{} = usuarios} = Usuario.update_usuarios(usuarios, update_attrs)
      assert usuarios.email == "some updated email"
      assert usuarios.nome == "some updated nome"
      assert usuarios.senha == "7488a646-e31f-11e4-aace-600308960668"
      assert usuarios.telefone == "some updated telefone"
    end

    test "update_usuarios/2 with invalid data returns error changeset" do
      usuarios = usuarios_fixture()
      assert {:error, %Ecto.Changeset{}} = Usuario.update_usuarios(usuarios, @invalid_attrs)
      assert usuarios == Usuario.get_usuarios!(usuarios.id)
    end

    test "delete_usuarios/1 deletes the usuarios" do
      usuarios = usuarios_fixture()
      assert {:ok, %Usuarios{}} = Usuario.delete_usuarios(usuarios)
      assert_raise Ecto.NoResultsError, fn -> Usuario.get_usuarios!(usuarios.id) end
    end

    test "change_usuarios/1 returns a usuarios changeset" do
      usuarios = usuarios_fixture()
      assert %Ecto.Changeset{} = Usuario.change_usuarios(usuarios)
    end
  end
end
