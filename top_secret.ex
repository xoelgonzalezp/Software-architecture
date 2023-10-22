defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part({fun, _, [{:when, _, [{funcion, _, parametro} | _]}, _]} = ast, result)
      when fun in [:def, :defp] do {ast, [extract_string(funcion, parametro) | result]}
  end

  def decode_secret_message_part({fun, _, [{nombre, _, parametro}, _]} = ast, result)
      when fun in [:def, :defp] do {ast, [String.slice(to_string(nombre), 0, length(parametro || [])) | result]}
  end

  def decode_secret_message_part(ast, result), do: {ast, result}
  defp extract_string(nombre, parametro), do: String.slice(Atom.to_string(nombre), 0, length(parametro|| []))

  def decode_secret_message(string) do
    {_, result} = Macro.prewalk(to_ast(string), [], &decode_secret_message_part/2)
    result |> Enum.reverse() |> Enum.join()
   end
end