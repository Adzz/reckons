defmodule LoanTest do
  use ExUnit.Case

  describe "monthly_repayments_for_loan/1" do
    test "correctly calculates the number of repayments needed when no interest" do
      result =
        %Loan{principal: 500, interest_rate: 0.0, monthly_repayment: 100}
        |> Loan.monthly_repayments_for_loan()

      assert result.monthly_repayments == 5
    end

    test "correctly calculates the number of repayments needed with interest" do
      result =
        %Loan{principal: 500, interest_rate: 0.10, monthly_repayment: 100}
        |> Loan.monthly_repayments_for_loan()

      assert result.monthly_repayments == 6
    end
  end
end
