defmodule TakeANumber do
  def start() do
    spawn(fn -> machine(0) end)
  end

 defp machine(estado) do
    receive do
      {:report_state, sender_pid} -> send(sender_pid, estado)
      machine(estado)
      {:take_a_number, sender_pid} -> send(sender_pid, estado + 1)
      machine(estado + 1)
      :stop -> :ok
      _ ->  machine(estado)
    end
 end
end

