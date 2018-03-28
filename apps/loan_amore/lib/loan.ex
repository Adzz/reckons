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
      new_principal_given(interest_rate, monthly_repayment, principal)
      |> monthly_repayments(interest_rate, monthly_repayment, monthly_repayments)
    else
      monthly_repayments
    end
  end

  def amortized_loan(
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

      amortized_loan(loan, [repayment | breakdown])
    else
      Enum.reverse(breakdown)
    end
  end

  def new_principal_given(interest_rate, monthly_repayment, principal) do
    principal - (monthly_repayment - interest_for_this_payment(principal, interest_rate))
  end

  def interest_for_this_payment(principal, interest_rate) do
    principal * interest_rate / 12
  end

  def total_cost(loan) do
    total_interest_cost(loan) + loan.principal
  end

  def total_interest_cost(loan) do
    loan
    |> amortized_loan()
    |> Enum.map(fn repayment -> repayment.interest_portion end)
    |> Enum.sum()
  end

  def monthly_repayment_amount(%Loan{
        principal: principal,
        interest_rate: interest_rate,
        monthly_repayments: monthly_repayments
      }) do
    # What even...
    v = 1 / (1 + interest_rate)
    y = :math.pow(v, (1 / 12))
    x = y * (1 - (:math.pow(v, (monthly_repayments/12))))
    z = x / (1 - y)
    principal / z
  end
end
