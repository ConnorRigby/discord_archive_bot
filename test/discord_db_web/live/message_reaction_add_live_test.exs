defmodule DiscordDbWeb.MessageReactionAddLiveTest do
  use DiscordDbWeb.ConnCase

  import Phoenix.LiveViewTest
  import DiscordDb.BrowserFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_message_reaction_add(_) do
    message_reaction_add = message_reaction_add_fixture()
    %{message_reaction_add: message_reaction_add}
  end

  describe "Index" do
    setup [:create_message_reaction_add]

    test "lists all message_reaction_add", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.message_reaction_add_index_path(conn, :index))

      assert html =~ "Listing Message reaction add"
    end

    test "saves new message_reaction_add", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.message_reaction_add_index_path(conn, :index))

      assert index_live |> element("a", "New Message reaction add") |> render_click() =~
               "New Message reaction add"

      assert_patch(index_live, Routes.message_reaction_add_index_path(conn, :new))

      assert index_live
             |> form("#message_reaction_add-form", message_reaction_add: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#message_reaction_add-form", message_reaction_add: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.message_reaction_add_index_path(conn, :index))

      assert html =~ "Message reaction add created successfully"
    end

    test "updates message_reaction_add in listing", %{conn: conn, message_reaction_add: message_reaction_add} do
      {:ok, index_live, _html} = live(conn, Routes.message_reaction_add_index_path(conn, :index))

      assert index_live |> element("#message_reaction_add-#{message_reaction_add.id} a", "Edit") |> render_click() =~
               "Edit Message reaction add"

      assert_patch(index_live, Routes.message_reaction_add_index_path(conn, :edit, message_reaction_add))

      assert index_live
             |> form("#message_reaction_add-form", message_reaction_add: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#message_reaction_add-form", message_reaction_add: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.message_reaction_add_index_path(conn, :index))

      assert html =~ "Message reaction add updated successfully"
    end

    test "deletes message_reaction_add in listing", %{conn: conn, message_reaction_add: message_reaction_add} do
      {:ok, index_live, _html} = live(conn, Routes.message_reaction_add_index_path(conn, :index))

      assert index_live |> element("#message_reaction_add-#{message_reaction_add.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#message_reaction_add-#{message_reaction_add.id}")
    end
  end

  describe "Show" do
    setup [:create_message_reaction_add]

    test "displays message_reaction_add", %{conn: conn, message_reaction_add: message_reaction_add} do
      {:ok, _show_live, html} = live(conn, Routes.message_reaction_add_show_path(conn, :show, message_reaction_add))

      assert html =~ "Show Message reaction add"
    end

    test "updates message_reaction_add within modal", %{conn: conn, message_reaction_add: message_reaction_add} do
      {:ok, show_live, _html} = live(conn, Routes.message_reaction_add_show_path(conn, :show, message_reaction_add))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Message reaction add"

      assert_patch(show_live, Routes.message_reaction_add_show_path(conn, :edit, message_reaction_add))

      assert show_live
             |> form("#message_reaction_add-form", message_reaction_add: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#message_reaction_add-form", message_reaction_add: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.message_reaction_add_show_path(conn, :show, message_reaction_add))

      assert html =~ "Message reaction add updated successfully"
    end
  end
end
