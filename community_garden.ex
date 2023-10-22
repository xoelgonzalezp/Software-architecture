# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []), do: Agent.start(fn -> {1, []} end, opts)
  def list_registrations(pid), do: Agent.get(pid, fn {_, registered_plots} -> registered_plots end)
  
  def register(pid, register_to) do
    Agent.get_and_update(pid, fn {id, registered_plots} ->
      plot = %Plot{plot_id: id, registered_to: register_to}
      {plot, {id + 1, [plot | registered_plots]}}
    end)
  end

  def release(pid, plot_id) do
    Agent.get_and_update(pid, fn {index, plots} -> new_plots = Enum.filter(plots, fn plot -> plot.plot_id != plot_id end)
    {:ok, {index, new_plots}}end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn  {_, plots} ->
      Enum.find(plots, {:not_found, "plot is unregistered"}, fn plot -> plot.plot_id == plot_id end) end)
  end
end
