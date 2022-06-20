defmodule Sorteio.InscricaoTest do
  use Sorteio.DataCase

  alias Sorteio.Inscricao

  describe "inscricao" do
    alias Sorteio.Inscricao.Inscricoes

    import Sorteio.InscricaoFixtures

    @invalid_attrs %{descricao: nil, votos: nil}

    test "list_inscricao/0 returns all inscricao" do
      inscricoes = inscricoes_fixture()
      assert Inscricao.list_inscricao() == [inscricoes]
    end

    test "get_inscricoes!/1 returns the inscricoes with given id" do
      inscricoes = inscricoes_fixture()
      assert Inscricao.get_inscricoes!(inscricoes.id) == inscricoes
    end

    test "create_inscricoes/1 with valid data creates a inscricoes" do
      valid_attrs = %{descricao: "some descricao", votos: 42}

      assert {:ok, %Inscricoes{} = inscricoes} = Inscricao.create_inscricoes(valid_attrs)
      assert inscricoes.descricao == "some descricao"
      assert inscricoes.votos == 42
    end

    test "create_inscricoes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inscricao.create_inscricoes(@invalid_attrs)
    end

    test "update_inscricoes/2 with valid data updates the inscricoes" do
      inscricoes = inscricoes_fixture()
      update_attrs = %{descricao: "some updated descricao", votos: 43}

      assert {:ok, %Inscricoes{} = inscricoes} = Inscricao.update_inscricoes(inscricoes, update_attrs)
      assert inscricoes.descricao == "some updated descricao"
      assert inscricoes.votos == 43
    end

    test "update_inscricoes/2 with invalid data returns error changeset" do
      inscricoes = inscricoes_fixture()
      assert {:error, %Ecto.Changeset{}} = Inscricao.update_inscricoes(inscricoes, @invalid_attrs)
      assert inscricoes == Inscricao.get_inscricoes!(inscricoes.id)
    end

    test "delete_inscricoes/1 deletes the inscricoes" do
      inscricoes = inscricoes_fixture()
      assert {:ok, %Inscricoes{}} = Inscricao.delete_inscricoes(inscricoes)
      assert_raise Ecto.NoResultsError, fn -> Inscricao.get_inscricoes!(inscricoes.id) end
    end

    test "change_inscricoes/1 returns a inscricoes changeset" do
      inscricoes = inscricoes_fixture()
      assert %Ecto.Changeset{} = Inscricao.change_inscricoes(inscricoes)
    end
  end
end
