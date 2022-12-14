defmodule DiscordDb.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id,	:snowflake, primary_key: true, autogenerate: false #, description: "the users id	identify"
      add :username,	:string #, description: "the users username, not unique across the platform	identify"
      add :discriminator,	:string #, description: "the users 4-digit discord-tag	identify"
      add :avatar, :string #, description: "the users avatar hash	identify"
      add :bot, :boolean #, description: "whether the user belongs to an OAuth2 application	identify"
      add :system, :boolean #, description: "whether the user is an Official Discord System user (part of the urgent message system)	identify"
      add :mfa_enabled, :boolean #, description: "whether the user has two factor enabled on their account	identify"
      add :banner, :string #, description: "string	the users banner hash	identify"
      add :accent_color, :integer #, description: "integer	the users banner color encoded as an integer representation of hexadecimal color code	identify"
      add :locale, :string #, description: "string	the users chosen language option	identify"
      add :verified, :boolean #, description: "whether the email on this account has been verified	email"
      add :email, :string #, description: "the users email	email"
      add :flags, :integer #, description: "the flags on a users account	identify"
      add :premium_type, :integer #, description: "the type of Nitro subscription on a users account	identify"
      add :public_flags, :integer #, description: "the public flags on a users account	identify"
      timestamps()
    end
  end
end
