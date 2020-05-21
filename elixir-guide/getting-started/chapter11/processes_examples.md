# Example Code for Processes Chapter

The function spawn/1 does the basic mechanism of spawning new processes
```elixir
iex(2)> spawn fn -> 4 + 12 end
#PID<0.108.0>
iex(3)> self() # Will generate the PID of the current process
#PID<0.105.0>
```
We can check if a process is alive through  Process.alive()
```elixir
iex(5)> process = spawn fn -> 4 + 12 end
#PID<0.112.0>
iex(6)> Process.alive?(process)
false
iex(7)> Process.alive?(self())
true
```
Send and Recieve allows us to send messages between processes
```elixir
iex(9)> parent = self() # current process
#PID<0.105.0>
iex(10)> spawn fn -> send(parent, {:message, self()}) end
#PID<0.119.0>
iex(11)> receive do
...(11)> {:message, pid} -> "Got a message from #{inspect pid}"
...(11)> end
"Got a message from #PID<0.119.0>"
```
The function flush() flushes and prints all the messages in the mailbox.
```elixir
iex(13)> send self(), :delete_me
:delete_me
iex(14)> flush() # flushes and prints all the messages in the mailbox
:delete_me
:ok
```
The function spawn_link/1 allows us to link processes, so if something fails in one, the failure propagates to the others
```elixir
iex(17)> self()
#PID<0.105.0>
iex(18)> spawn_link fn -> raise "horrible horrible error" end
** (EXIT from #PID<0.105.0>) shell process exited with reason: an exception was raised:
    ** (RuntimeError) horrible horrible error
        (stdlib 3.12.1) erl_eval.erl:678: :erl_eval.do_apply/6

Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
12:33:04.403 [error] Process #PID<0.133.0> raised an exception
** (RuntimeError) horrible horrible error
    (stdlib 3.12.1) erl_eval.erl:678: :erl_eval.do_apply/6
```
Tasks are built on top of spawn functions and give better error reports
```elixir
iex(2)> Task.start fn -> raise "ERRRRROORRRRRR" end
{:ok, #PID<0.108.0>}
iex(3)>
12:38:50.261 [error] Task #PID<0.105.0> started from #PID<0.108.0> terminating
** (RuntimeError) ERRRRROORRRRRR
    (stdlib 3.12.1) erl_eval.erl:678: :erl_eval.do_apply/6
    (elixir 1.10.3) lib/task/supervised.ex:90: Task.Supervised.invoke_mfa/2
    (stdlib 3.12.1) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
Function: #Function<21.126501267/0 in :erl_eval.expr/5>
    Args: []
```


