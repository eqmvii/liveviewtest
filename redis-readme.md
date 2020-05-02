# Trial redis connection:

```
iex(5)> {:ok, conn} = Redix.start_link("redis://redis:6379/3",
name: :redix)
{:ok, #PID<0.306.0>}
iex(6)> Redix.command(conn, ["SET", "m", "f"])
{:ok, "OK"}
iex(7)> Redix.command(conn, ["GET", "not_a_real_key"])
{:ok, nil}
iex(8)> Redix.command(conn, ["GET", "m"])
{:ok, "f"}
```
