defmodule RPG do
  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []
  end

  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

  defprotocol Edible do
    def eat(item, character)
  end

  defimpl RPG.Edible, for: RPG.LoafOfBread do
  def eat(_loaf_of_bread, character) do
    updated_character = %RPG.Character{character | health: character.health + 5}
    {nil, updated_character}
  end
 end

 defimpl RPG.Edible, for: RPG.ManaPotion do
  def eat(mana_potion, character) do
    updated_character = %RPG.Character{character | mana: character.mana + mana_potion.strength}
    empty_bottle = %RPG.EmptyBottle{}
    {empty_bottle, updated_character}
  end
 end

 defimpl RPG.Edible, for: RPG.Poison do
  def eat(_poison, character) do
    updated_character = %RPG.Character{character | health: 0}
    empty_bottle = %RPG.EmptyBottle{}
    {empty_bottle, updated_character}
  end
end
end
