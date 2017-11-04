defmodule Slash.BankRouterTest do
  use ExUnit.Case

  alias Slash.Command.OpenBankAccount
  alias Slash.BankRouter

  test "dispatch" do
    :ok = BankRouter.dispatch(
      %OpenBankAccount{account_number: "ACC123456", initial_balance: 1_000})
  end
end
