defmodule Repayment do
  @keys [:interest_portion, :principal_portion, :total]
  @enforce_keys @keys
  defstruct @keys

  def new(interest_portion, principal_portion, total) do
    %__MODULE__{
      interest_portion: interest_portion,
      principal_portion: principal_portion,
      total: total
    }
  end
end
