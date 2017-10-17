defmodule Sweetener do
  @moduledoc """
  Sweetener is a set of nifty functions I missed in Elixir core.
  """

  @doc """
  An implementation of ruby’s `tap` method. Inside the block the tapped value
  is accessible with `_()` function.

  For convenience, `{:ok, value}` is tapped as `value` itself,
  everything else is tapped as is.

  ```elixir
  tapped = tap {:ok, 42} do
             42 = _()
             :error
           end
  assert tapped == {:ok, 42}
  ```

  It’s useful for more concise logging etc. without intermediate local variables:

  ```elixir
  use Sweetener

  tap Supervisor.start_link(children, opts) do
    IO.inspect Supervisor.count_children(_())
    #=> %{active: 1, specs: 1, supervisors: 0, workers: 1}
  end #=> returning {:ok, pid} tuple
  ```
  """
  defmacro __using__(_args \\ []) do
    quote do
      require Sweetener
      alias Sweetener

      defp _() do
        with {:dictionary, dict} <- Process.info(self(), :dictionary) do
          case dict[:tapped] do
            {:ok, value} -> value
            whatever -> whatever
          end
        else
          _ -> nil
        end
      end

      defmacro tap(tapped, do: block) do
        quote do
          t = unquote(tapped)
          Process.put(:tapped, t)
          unquote(block)
          Process.delete(:tapped)
          t
        end
      end
    end
  end
end
