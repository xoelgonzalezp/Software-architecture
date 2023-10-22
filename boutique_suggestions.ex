defmodule BoutiqueSuggestions do

  def get_combinations(tops, bottoms, options \\ []) do
    maximum_price = Keyword.get(options, :maximum_price, 100.00)
    for top <- tops, bottom <- bottoms, top.base_color != bottom.base_color, price_valid?(top, bottom, maximum_price), do: {top, bottom}
   end

  defp price_valid?(top, bottom, maximum_price), do: top.price + bottom.price <= maximum_price
end