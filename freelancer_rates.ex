defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0 
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100 )  
  end

  def monthly_rate(hourly_rate, discount) do
    daily = daily_rate(hourly_rate)
    monthly = daily * 22
    rate = apply_discount(monthly,discount)
    ceil(rate)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily = daily_rate(hourly_rate)
    days = budget / apply_discount(daily,discount)
    Float.floor(days,1)  
  end

end
