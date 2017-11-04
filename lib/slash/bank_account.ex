defmodule Slash.BankAccount do
  defstruct [account_number: nil, balance: nil]

  alias Slash.Command.OpenBankAccount
  alias Slash.Action.BankAccountOpened

  #####
  # Public API

  # Happy route :)
  def execute(
    %__MODULE__{account_number: nil},
    %OpenBankAccount{
      account_number: account_number,
      initial_balance: initial_balance
    })
  when initial_balance > 0 do
    %BankAccountOpened{
      account_number: account_number,
      initial_balance: initial_balance
    }
  end

  # Initial bank account is empty :(
  def execute(
    %__MODULE__{},
    %OpenBankAccount{initial_balance: initial_balance})
  when initial_balance <= 0 do
    {:error, :initial_balance_must_be_above_zero}
  end

  # Ensure account has not already been opened :(
  def execute(%__MODULE__{account_number: nil}, %OpenBankAccount{}) do
    # If it doesn't have an account number it must already be opened
    {:error, :account_already_opened}
  end

  #####
  # State mutators
  def apply(
    %__MODULE__{} = account,
    %BankAccountOpened{
      account_number: account_number,
      initial_balance: initial_balance
    }) do
    %__MODULE__{
      account |
      account_number: account_number,
      balance: initial_balance
    }
  end
end
