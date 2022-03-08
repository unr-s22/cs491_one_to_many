defmodule OneToManyWeb.PageController do
  use OneToManyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
