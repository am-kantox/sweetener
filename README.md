# Sweetener

[![Build Status](https://travis-ci.org/am-kantox/sweetener.svg?branch=master)](https://travis-ci.org/am-kantox/sweetener) **Set of nifty functions I missed in Elixir core.**

Helpers provided so far:

- `tap` an analogue of ruby’s `tap` method.   It’s useful for more concise
logging/external calls without intermediate local variables:

```elixir
use Sweetener

tap Supervisor.start_link(children, opts) do
  IO.inspect Supervisor.count_children(_())
  #=> %{active: 1, specs: 1, supervisors: 0, workers: 1}
end #=> returning {:ok, pid} tuple
```

## Installation

Add `sweetener` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:sweetener, "~> 0.1.0"}
  ]
end
```

Documentation can be found at [https://hexdocs.pm/sweetener](https://hexdocs.pm/sweetener).

