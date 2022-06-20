defmodule SorteioWeb.InscricoesControllerTest do
  use SorteioWeb.ConnCase

  import Sorteio.InscricaoFixtures

  alias Sorteio.Inscricao.Inscricoes

  @create_attrs %{
    descricao: "some descricao",
    votos: 42
  }
  @update_attrs %{
    descricao: "some updated descricao",
    votos: 43
  }
  @invalid_attrs %{descricao: nil, votos: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all inscricao", %{conn: conn} do
      conn = get(conn, Routes.inscricoes_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create inscricoes" do
    test "renders inscricoes when data is valid", %{conn: conn} do
      conn = post(conn, Routes.inscricoes_path(conn, :create), inscricoes: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.inscricoes_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "descricao" => "some descricao",
               "votos" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.inscricoes_path(conn, :create), inscricoes: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update inscricoes" do
    setup [:create_inscricoes]

    test "renders inscricoes when data is valid", %{conn: conn, inscricoes: %Inscricoes{id: id} = inscricoes} do
      conn = put(conn, Routes.inscricoes_path(conn, :update, inscricoes), inscricoes: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.inscricoes_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "descricao" => "some updated descricao",
               "votos" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, inscricoes: inscricoes} do
      conn = put(conn, Routes.inscricoes_path(conn, :update, inscricoes), inscricoes: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete inscricoes" do
    setup [:create_inscricoes]

    test "deletes chosen inscricoes", %{conn: conn, inscricoes: inscricoes} do
      conn = delete(conn, Routes.inscricoes_path(conn, :delete, inscricoes))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.inscricoes_path(conn, :show, inscricoes))
      end
    end
  end

  defp create_inscricoes(_) do
    inscricoes = inscricoes_fixture()
    %{inscricoes: inscricoes}
  end
end
