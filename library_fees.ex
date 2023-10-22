defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do  
    Time.compare(NaiveDateTime.to_time(datetime), ~T[12:00:00]) == :lt
  end

  def return_date(checkout_datetime) do
     days = if before_noon?(checkout_datetime), do: 28, else: 29
     NaiveDateTime.add(checkout_datetime, days, :day) |> NaiveDateTime.to_date()  
  end

  def days_late(planned_return_date, actual_return_datetime) do

   difference =NaiveDateTime.to_date(actual_return_datetime) |> Date.diff(planned_return_date)
   if difference <= 0 do 
    0
   else 
     difference
   end    
  end

  def monday?(datetime) do
    date = NaiveDateTime.to_date(datetime) 
    Date.day_of_week(date) == 1 
  end

  def calculate_late_fee(checkout, return, rate) do
  checkout_datetime = datetime_from_string(checkout)
  return_datetime = datetime_from_string(return)
  expected_date = return_date(checkout_datetime)
  days = days_late(expected_date, return_datetime)
  offer =
    if monday?(return_datetime) do
      0.5
    else
      1
    end
  total_fee = days * rate * offer
  Kernel.floor(total_fee)
  end
end
