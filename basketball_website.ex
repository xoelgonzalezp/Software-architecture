defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    extract(data,String.split(path, "."))
  end

  defp extract(data,[]), do: data
  defp extract(data,[key | keys]) do
       extract(data[key],keys)
  end

 
  def get_in_path(data, path) do
   Kernel.get_in(data,String.split(path, "."))
  end
end