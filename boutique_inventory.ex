defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
      Enum.sort_by(inventory, fn %{price: price} -> price end)
  end

  def with_missing_price(inventory) do
     Enum.filter(inventory, fn %{price: nil} -> true; _ -> false end)
  end

  def update_names(inventory, old_word, new_word) do
     Enum.map(inventory, fn item -> %{item | name: String.replace(item.name, old_word, new_word)} end)
  end

  def increase_quantity(item, count) do
    increased = Map.new(item.quantity_by_size, fn {size, quantity} -> {size, quantity + count} end)
    %{item | quantity_by_size: increased}
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_size, quantity}, total -> total+ quantity end)
  end
end
