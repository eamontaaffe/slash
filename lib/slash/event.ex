defmodule Slash.Action do
  @moduledoc "All of the actions should be defined here"
  defmodule BankAccountOpened do
    defstruct [:account_number, :initial_balance]
  end
end
