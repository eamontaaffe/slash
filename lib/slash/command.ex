defmodule Slash.Command do
  @moduledoc "All of the commands for this project can be defined here"
  defmodule OpenBankAccount do
    defstruct [:account_number, :initial_balance]
  end
end
