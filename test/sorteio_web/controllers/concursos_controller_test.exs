defmodule SorteioWeb.ConcursosControllerTest do
  use SorteioWeb.ConnCase

  import Sorteio.ConcursoFixtures

  alias Sorteio.Concurso.Concursos

  @create_attrs %{
    data: ~T[14:00:00],
    nome: "some nome",
    receita: "some receita"
  }
  @update_attrs %{
    data: ~T[15:01:01],
    nome: "some updated nome",
    receita: "some updated receita"
  }
  @invalid_attrs %{data: nil, nome: nil, receita: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all concurso", %{conn: conn} do
      conn = get(conn, Routes.concursos_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create concursos" do
    test "renders concursos when data is valid", %{conn: conn} do
      conn = post(conn, Routes.concursos_path(conn, :create), concursos: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.concursos_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "data" => "14:00:00",
               "nome" => "some nome",
               "receita" => "some receita"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.concursos_path(conn, :create), concursos: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update concursos" do
    setup [:create_concursos]

    test "renders concursos when data is valid", %{conn: conn, concursos: %Concursos{id: id} = concursos} do
      conn = put(conn, Routes.concursos_path(conn, :update, concursos), concursos: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.concursos_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "data" => "15:01:01",
               "nome" => "some updated nome",
               "receita" => "some updated receita"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, concursos: concursos} do
      conn = put(conn, Routes.concursos_path(conn, :update, concursos), concursos: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete concursos" do
    setup [:create_concursos]

    test "deletes chosen concursos", %{conn: conn, concursos: concursos} do
      conn = delete(conn, Routes.concursos_path(conn, :delete, concursos))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.concursos_path(conn, :show, concursos))
      end
    end
  end

  defp create_concursos(_) do
    concursos = concursos_fixture()
    %{concursos: concursos}
  end
end
