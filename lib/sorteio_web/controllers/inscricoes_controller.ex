defmodule SorteioWeb.InscricoesController do
  use SorteioWeb, :controller

  alias Sorteio.Inscricao
  alias Sorteio.Inscricao.Inscricoes

  action_fallback SorteioWeb.FallbackController

  def index(conn, _params) do
    inscricao = Inscricao.list_inscricao()
    render(conn, "index.json", inscricao: inscricao)
  end

  def create(conn, %{"inscricoes" => inscricoes_params}) do
    with {:ok, %Inscricoes{} = inscricoes} <- Inscricao.create_inscricoes(inscricoes_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.inscricoes_path(conn, :show, inscricoes))
      |> render("show.json", inscricoes: inscricoes)
    end
  end

  def show(conn, %{"id" => id}) do
    inscricoes = Inscricao.get_inscricoes!(id)
    render(conn, "show.json", inscricoes: inscricoes)
  end

  def update(conn, %{"id" => id, "inscricoes" => inscricoes_params}) do
    inscricoes = Inscricao.get_inscricoes!(id)

    with {:ok, %Inscricoes{} = inscricoes} <- Inscricao.update_inscricoes(inscricoes, inscricoes_params) do
      render(conn, "show.json", inscricoes: inscricoes)
    end
  end

  def delete(conn, %{"id" => id}) do
    inscricoes = Inscricao.get_inscricoes!(id)

    with {:ok, %Inscricoes{}} <- Inscricao.delete_inscricoes(inscricoes) do
      send_resp(conn, :no_content, "")
    end
  end
end
