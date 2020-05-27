defmodule KV.RouterTest do
    use ExUnit.Case

    setup_all do
      current = Application.get_env(:kv, :routing_table)

      Application.put_env(:kv, :routing_table, [
        {?a..?m, :"foo@CL-s-Nongamer-CP"},
        {?n..?z, :"bar@CL-s-Nongamer-CP"}
      ])  

      on_exit fn -> Application.put_env(:kv, :routing_table, current) end
    end

    @tag :distributed
    test "route requests across nodes" do
      assert KV.Router.route("hello", Kernel, :node, []) ==
             :"foo@CL-s-Nongamer-CP"
      assert KV.Router.route("world", Kernel, :node, []) ==
             :"bar@CL-s-Nongamer-CP"
    end
  
    test "raises on unknown entries" do
      assert_raise RuntimeError, ~r/Could not find entry/, fn ->
        KV.Router.route(<<0>>, Kernel, :node, [])
      end
    end
end