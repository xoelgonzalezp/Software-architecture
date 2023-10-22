defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class(), do: Enum.random(@planetary_classes)

  def random_ship_registry_number() do
    prefix = "NCC-"
    number = Enum.random(1000..9999)
    "#{prefix}#{number}"
  end

  def random_stardate(), do: :rand.uniform() * 1000.0 + 41000.0

  def format_stardate(stardate), do: :io_lib.format("~.1f", [stardate]) |> to_string()

end
