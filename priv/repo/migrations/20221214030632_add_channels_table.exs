defmodule DiscordDb.Repo.Migrations.AddChannelsTable do
  use Ecto.Migration

  def change do
    create table(:channels, primary_key: false) do
      add :id, :snowflake, primary_key: true #, description: "the id of this channel"
      add :type, :integer #, description: "the type of channel"
      add :guild_id, :snowflake #, description: "the id of the guild (may be missing for some channel objects received over gateway guild dispatches)"
      add :position, :integer #, description: "sorting position of the channel"
      # # add :permission_overwrites, :array #, description: "of overwrite objects explicit permission overwrites for members and roles"
      add :name, :string #, description: "the name of the channel (1-100 characters)"
      add :topic, :string #, description: "the channel topic (0-4096 characters for GUILD_FORUM channels, 0-1024 characters for all others)"
      add :nsfw, :boolean #, description: "whether the channel is nsfw"
      add :last_message_id, :snowflake #, description: "the id of the last message sent in this channel (or thread for GUILD_FORUM channels) (may not point to an existing or valid message or thread)"
      add :bitrate, :integer #, description: "the bitrate (in bits) of the voice channel"
      add :user_limit, :integer #, description: "the user limit of the voice channel"
      add :rate_limit_per_user, :integer #, description: "amount of seconds a user has to wait before sending another message (0-21600); bots, as well as users with the permission manage_messages or manage_channel, are unaffected"
      # # add :recipients, :array #, description: "of user objects the recipients of the DM"
      add :icon, :string #, description: "icon hash of the group DM"
      add :owner_id, :snowflake #, description: "id of the creator of the group DM or thread"
      add :application_id, :snowflake #, description: "application id of the group DM creator if it is bot-created"
      add :parent_id, :snowflake #, description: "for guild channels: id of the parent category for a channel (each parent category can contain up to 50 channels), for threads: id of the text channel this thread was created"
      add :last_pin_timestamp, :utc_datetime #, description: "timestamp when the last pinned message was pinned. This may be null in events such as GUILD_CREATE when a message is not pinned."
      add :rtc_region, :string #, description: "voice region id for the voice channel, automatic when set to null"
      add :video_quality_mode, :integer #, description: "the camera video quality mode of the voice channel, 1 when not present"
      add :message_count, :integer #, description: "number of messages (not including the initial message or deleted messages) in a thread."
      add :member_count, :integer #, description: "an approximate count of users in a thread, stops counting at 50"
      # # add :thread_metadata, :a #, description: "thread metadata object thread-specific fields not needed by other channels"
      # # add :member, :a #, description: "thread member object thread member object for the current user, if they have joined the thread, only included on certain API endpoints"
      add :default_auto_archive_duration, :integer #, description: "default duration, copied onto newly created threads, in minutes, threads will stop showing in the channel list after the specified period of inactivity, can be set to: 60, 1440, 4320, 10080"
      add :permissions, :string #, description: "computed permissions for the invoking user in the channel, including overwrites, only included when part of the resolved data received on a slash command interaction"
      add :flags, :integer #, description: "channel flags combined as a bitfield"
      add :total_message_sent, :integer #, description: "number of messages ever sent in a thread, it's similar to message_count on message creation, but will not decrement the number when a message is deleted"
      # # add :available_tags, :array #, description: "of tag objects the set of tags that can be used in a GUILD_FORUM channel"
      # # add :applied_tags, :array #, description: "of snowflakes the IDs of the set of tags that have been applied to a thread in a GUILD_FORUM channel"
      # add :default_reaction_emoji, :default #, description: "reaction object the emoji to show in the add reaction button on a thread in a GUILD_FORUM channel"
      add :default_thread_rate_limit_per_user, :integer #, description: "the initial rate_limit_per_user to set on newly created threads in a channel. this field is copied to the thread at creation time and does not live update."
      add :default_sort_order, :integer #, description: "the default sort order type used to order posts in GUILD_FORUM channels. Defaults to null, which indicates a preferred sort order hasn't been set by a channel admin"
      add :default_forum_layout, :integer #, description: "the default forum layout view used to display posts in GUILD_FORUM channels. Defaults to 0, which indicates a layout view has not been set by a channel admin"
      timestamps()
    end
  end
end
