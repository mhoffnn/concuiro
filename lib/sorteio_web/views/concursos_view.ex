defmodule SorteioWeb.ConcursosView do
  use SorteioWeb, :view
  alias SorteioWeb.ConcursosView

  def render("index.json", %{concurso: concurso}) do
    %{data: render_many(concurso, ConcursosView, "concursos.json")}
  end

  def render("show.json", %{concursos: concursos}) do
    %{data: render_one(concursos, ConcursosView, "concursos.json")}
  end

  def render("concursos.json", %{concursos: concursos}) do
    %{
      id: concursos.id,
      nome: concursos.nome,
      receita: concursos.receita,
      data: concursos.data
    }
  end
end
