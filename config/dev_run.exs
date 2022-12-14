import Config

discord_token = System.fetch_env!("DISCORD_TOKEN")
config :nostrum,
  token: discord_token,
  gateway_intents: :all

import_config("dev.exs")
