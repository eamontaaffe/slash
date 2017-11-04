defmodule Slash.BankRouter do
  use Commanded.Commands.Router

  alias Slash.Command.OpenBankAccount
  alias Slash.BankAccount

  dispatch OpenBankAccount, to: BankAccount, identity: :account_number
end
