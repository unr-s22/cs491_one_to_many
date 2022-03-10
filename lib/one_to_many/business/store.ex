defmodule OneToMany.Business.Store do
  use Ecto.Schema
  import Ecto.Changeset
  alias OneToMany.Business.Company

  @timestamps_opts [type: :utc_datetime_usec]
  schema "stores" do
    field :name, :string
    belongs_to :company, OneToMany.Business.Company
    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:name, :company_id])
    |> validate_required([:name])
  end
end
