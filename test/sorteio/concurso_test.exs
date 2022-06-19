defmodule Sorteio.ConcursoTest do
  use Sorteio.DataCase

  alias Sorteio.Concurso

  describe "concurso" do
    alias Sorteio.Concurso.Concursos

    import Sorteio.ConcursoFixtures

    @invalid_attrs %{data: nil, nome: nil, receita: nil}

    test "list_concurso/0 returns all concurso" do
      concursos = concursos_fixture()
      assert Concurso.list_concurso() == [concursos]
    end

    test "get_concursos!/1 returns the concursos with given id" do
      concursos = concursos_fixture()
      assert Concurso.get_concursos!(concursos.id) == concursos
    end

    test "create_concursos/1 with valid data creates a concursos" do
      valid_attrs = %{data: ~T[14:00:00], nome: "some nome", receita: "some receita"}

      assert {:ok, %Concursos{} = concursos} = Concurso.create_concursos(valid_attrs)
      assert concursos.data == ~T[14:00:00]
      assert concursos.nome == "some nome"
      assert concursos.receita == "some receita"
    end

    test "create_concursos/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Concurso.create_concursos(@invalid_attrs)
    end

    test "update_concursos/2 with valid data updates the concursos" do
      concursos = concursos_fixture()
      update_attrs = %{data: ~T[15:01:01], nome: "some updated nome", receita: "some updated receita"}

      assert {:ok, %Concursos{} = concursos} = Concurso.update_concursos(concursos, update_attrs)
      assert concursos.data == ~T[15:01:01]
      assert concursos.nome == "some updated nome"
      assert concursos.receita == "some updated receita"
    end

    test "update_concursos/2 with invalid data returns error changeset" do
      concursos = concursos_fixture()
      assert {:error, %Ecto.Changeset{}} = Concurso.update_concursos(concursos, @invalid_attrs)
      assert concursos == Concurso.get_concursos!(concursos.id)
    end

    test "delete_concursos/1 deletes the concursos" do
      concursos = concursos_fixture()
      assert {:ok, %Concursos{}} = Concurso.delete_concursos(concursos)
      assert_raise Ecto.NoResultsError, fn -> Concurso.get_concursos!(concursos.id) end
    end

    test "change_concursos/1 returns a concursos changeset" do
      concursos = concursos_fixture()
      assert %Ecto.Changeset{} = Concurso.change_concursos(concursos)
    end
  end
end
