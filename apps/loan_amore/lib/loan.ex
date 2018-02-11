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

defmodule Loan do
  @moduledoc """
  """

  @enforce_keys [:principal, :interest_rate]
  defstruct [:principal, :interest_rate, monthly_repayment: 0, monthly_repayments: 0]

  def new(principal, interest_rate, monthly_repayment \\ 0, monthly_repayments \\ 0) do
    %__MODULE__{
      principal: principal,
      interest_rate: interest_rate,
      monthly_repayment: monthly_repayment,
      monthly_repayments: monthly_repayments
    }
  end

  def monthly_repayments_for_loan(
        loan = %__MODULE__{
          principal: principal,
          interest_rate: interest_rate,
          monthly_repayment: monthly_repayment
        }
      ) do
    %__MODULE__{
      principal: principal,
      interest_rate: interest_rate,
      monthly_repayment: monthly_repayment,
      monthly_repayments: monthly_repayments(principal, interest_rate, monthly_repayment)
    }
  end

  def monthly_repayments(principal, interest_rate, monthly_repayment, monthly_repayments \\ 0) do
    monthly_repayments = monthly_repayments + 1

    if principal >= monthly_repayment do
      interest_portion = principal * interest_rate / 12
      principal_portion = monthly_repayment - interest_portion
      new_principal = principal - principal_portion

      monthly_repayments(new_principal, interest_rate, monthly_repayment, monthly_repayments)
    else
      monthly_repayments
    end
  end

  def calculate_monthly_repayment(principal, interest_rate, monthly_repayments) do
    #
  end

  def display_breakdown(
        loan = %Loan{
          principal: principal,
          interest_rate: interest_rate,
          monthly_repayment: monthly_repayment,
          monthly_repayments: monthly_repayments
        },
        breakdown \\ []
      ) do
    monthly_repayments = monthly_repayments - 1

    if monthly_repayments > 0 do
      interest_portion = principal * interest_rate / 12
      principal_portion = monthly_repayment - interest_portion
      new_principal = principal - principal_portion

      repayment = Repayment.new(interest_portion, principal_portion, monthly_repayment)

      loan = %{loan | principal: new_principal, monthly_repayments: monthly_repayments}

      display_breakdown(loan, [repayment | breakdown])
    else
      Enum.reverse(breakdown)
    end
  end
end
