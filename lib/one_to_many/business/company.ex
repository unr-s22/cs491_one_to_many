defmodule OneToMany.Business.Company do
  use Ecto.Schema
  import Ecto.Changeset

  alias OneToMany.Business.Store

  @timestamps_opts [type: :utc_datetime_usec]

  schema "companies" do
    field :name, :string
    has_many :stores, Store
    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
