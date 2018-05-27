use Mix.Config

config :exq_scheduler, :storage_opts,
  namespace: "exq_scheduler",
  exq_namespace: "exq"

config :exq_scheduler, :server_opts,
  missed_jobs_threshold_duration: 100_000,
  time_zone: "Asia/Kolkata"

config :exq_scheduler, :redis,
  name: ExqScheduler.Redis.Client,
  child_spec: {
    Redix,
    [
      [host: "127.0.0.1", port: 6379, database: 0],
      [name: ExqScheduler.Redis.Client]
    ]
  }

config :exq_scheduler, :schedules, []

import_config "#{Mix.env()}.exs"
