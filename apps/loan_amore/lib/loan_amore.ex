# There are 3 things we might want to do here

# 1, We have a principle, interest rate and a loan length, we need to work out what the repayments have to be to completely pay off the loan in the given time
# 2. We have a principle, interest rate and a repayment per month, we need to work out how long it will take to pay off the loan completely
# 3. We have a principle, interest rate, a repayment per month AND a timeframe, and we just want to see the break down of costs for each repayment

# defmodule LoanAmore.Process do
#   @enforce_keys [:pid]
#   defstruct [:pid]

#   def new(pid) do
#     %__MODULE__{
#       pid: pid
#     }
#   end
# end

# defmodule Repayment do
#   @keys [:interest_portion, :principal_portion]
#   @enforce_keys @keys
#   defstruct @keys

#   def new(interest_portion, principal_portion) do
#     %__MODULE__{
#       interest_portion: interest_portion,
#       principal_portion: principal_portion
#     }
#   end
# end

# defmodule LoanAmore do
#   def start(loan = %Loan{}) do
#     LoanAmore.Process.new(spawn(fn -> loop(%{loan: loan, repayments: []}) end))
#   end

#   def result(%LoanAmore.Process{pid: pid}) do
#     send(pid, {:result, self()})

#     receive do
#       {:response, %{loan: loan, repayments: repayments}} ->
#         %{loan: loan, repayments: Enum.reverse(repayments)}

#       error ->
#         error
#     end
#   end

#   def amortize_over(process = %LoanAmore.Process{}, number_of_repayments) do
#     for _ <- 0..number_of_repayments do
#       make_repayment(process)
#     end
#     result(process)
#   end

#   def make_repayment(process = %LoanAmore.Process{pid: pid}) do
#     send(pid, :make_repayment)
#     process
#   end

#   defp loop(current_state) do
#     new_state =
#       receive do
#         message -> process_message(message, current_state)
#       end

#     loop(new_state)
#   end

#   defp process_message({:result, caller}, current_state) do
#     send(caller, {:response, current_state})
#   end

#   defp process_message(:make_repayment, %{loan: %Loan{principal: principal}}) when principal <= 0 do

#   end

#   defp process_message(:make_repayment, %{
#          loan:
#            loan = %Loan{
#              principal: principal,
#              annual_interest_rate: annual_interest_rate,
#              monthly_repayment: monthly_repayment
#            },
#          repayments: repayments
#        }) do
#     interest_portion = principal * annual_interest_rate / 12
#     principal_portion = monthly_repayment - interest_portion

#     repayment = Repayment.new(interest_portion, principal_portion)

#     new_repayments = [repayment | repayments]
#     new_loan = %{loan | principal: principal - principal_portion}
#     %{loan: new_loan, repayments: new_repayments}
#   end

#   defp process_message(_, current_state) do
#     IO.puts("Error!")
#     current_state
#   end
# end

# defmodule Loan do
#   def start(principal) do
#     spawn(fn -> loop(principal) end)
#   end

#   defp loop(current_state) do
#     new_state =
#       receive do
#         message -> process_message(message, current_state)
#       end

#     loop(new_state)
#   end

#   defp process_message() do
#   end
# end
