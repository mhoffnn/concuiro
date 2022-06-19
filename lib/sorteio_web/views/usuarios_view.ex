defmodule SorteioWeb.UsuariosView do
  use SorteioWeb, :view
  alias SorteioWeb.UsuariosView

  def render("index.json", %{usuario: usuario}) do
    %{data: render_many(usuario, UsuariosView, "usuarios.json")}
  end

  def render("show.json", %{usuarios: usuarios}) do
    %{data: render_one(usuarios, UsuariosView, "usuarios.json")}
  end

  def render("usuarios.json", %{usuarios: usuarios}) do
    %{
      id: usuarios.id,
      nome: usuarios.nome,
      senha: usuarios.senha,
      email: usuarios.email,
      telefone: usuarios.telefone
    }
  end
end
