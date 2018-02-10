defmodule Loan do
  @moduledoc """
  """
  @keys [
    :principal,
    :annual_interest_rate,
    :monthly_repayment
  ]
  @enforce_keys @keys
  defstruct @keys

  def new(principal, annual_interest_rate, monthly_repayment) do
    %__MODULE__{
      principal: principal,
      annual_interest_rate: annual_interest_rate,
      monthly_repayment: monthly_repayment
    }
  end
end
