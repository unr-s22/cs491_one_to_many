# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     OneToMany.Repo.insert!(%OneToMany.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias OneToMany.Business.{Company, Store}
alias OneToMany.Repo

Repo.insert_all(
  Company,
  [
    %{name: "My Company", inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()},
    %{name: "Your Company", inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()},
    %{name: "Another Company", inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()}
  ],
  on_conflict: :nothing
)
