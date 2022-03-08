defmodule OneToManyWeb.StoreController do
  use OneToManyWeb, :controller

  alias OneToMany.Business
  alias OneToMany.Business.Store
  alias OneToMany.Repo

  def index(conn, _params) do
    stores = Business.list_stores()
    render(conn, "index.html", stores: stores)
  end

  def new(conn, _params) do
    changeset = Business.change_store(%Store{})
    companies = Business.list_companies()
    render(conn, "new.html", changeset: changeset, companies: companies)
  end

  def create(conn, %{"store" => store_params}) do
    case Business.create_store(store_params) do
      {:ok, store} ->
        conn
        |> put_flash(:info, "Store created successfully.")
        |> redirect(to: Routes.store_path(conn, :show, store))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    store = Business.get_store!(id)
    render(conn, "show.html", store: store)
  end

  def edit(conn, %{"id" => id}) do
    store = Business.get_store!(id)
    changeset = Business.change_store(store)
    render(conn, "edit.html", store: store, changeset: changeset)
  end

  def update(conn, %{"id" => id, "store" => store_params}) do
    store = Business.get_store!(id)

    case Business.update_store(store, store_params) do
      {:ok, store} ->
        conn
        |> put_flash(:info, "Store updated successfully.")
        |> redirect(to: Routes.store_path(conn, :show, store))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", store: store, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    store = Business.get_store!(id)
    {:ok, _store} = Business.delete_store(store)

    conn
    |> put_flash(:info, "Store deleted successfully.")
    |> redirect(to: Routes.store_path(conn, :index))
  end
end
