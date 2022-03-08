defmodule OneToMany.BusinessTest do
  use OneToMany.DataCase

  alias OneToMany.Business

  describe "companies" do
    alias OneToMany.Business.Company

    import OneToMany.BusinessFixtures

    @invalid_attrs %{name: nil}

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Business.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Business.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Company{} = company} = Business.create_company(valid_attrs)
      assert company.name == "some name"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Company{} = company} = Business.update_company(company, update_attrs)
      assert company.name == "some updated name"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_company(company, @invalid_attrs)
      assert company == Business.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Business.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Business.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Business.change_company(company)
    end
  end

  describe "stores" do
    alias OneToMany.Business.Store

    import OneToMany.BusinessFixtures

    @invalid_attrs %{name: nil}

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert Business.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert Business.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Store{} = store} = Business.create_store(valid_attrs)
      assert store.name == "some name"
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Store{} = store} = Business.update_store(store, update_attrs)
      assert store.name == "some updated name"
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_store(store, @invalid_attrs)
      assert store == Business.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = Business.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> Business.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = Business.change_store(store)
    end
  end
end
