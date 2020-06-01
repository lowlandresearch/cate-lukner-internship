import Config
config :iex, default_prompt: ">>>"
config :kv, :routing_table, [{?a..?z, node()}]

if Mix.env() == :prod do
    config :kv, :routing_table, [{?a..?z, :"foo@CL-s-Nongamer-CP"}]
end