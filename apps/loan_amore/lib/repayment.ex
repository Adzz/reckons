defmodule Repayment do
  @moduledoc """
  A repayment represents a single repayment for a loan. It has an interest portion, a principal portion
  and a total amount. The total amount should always equal the interest portion + principal portion.
  """

  @keys [:interest_portion, :principal_portion, :total]
  @enforce_keys @keys
  defstruct @keys

  @type t :: %__MODULE__{}

  def new(interest_portion, principal_portion, total) do
    %__MODULE__{
      interest_portion: interest_portion,
      principal_portion: principal_portion,
      total: total
    }
  end
end
