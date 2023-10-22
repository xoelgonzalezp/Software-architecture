defmodule LogParser do
  def valid_line?(line) do
      Regex.match?(~r/^\[DEBUG|INFO|WARNING|ERROR].+/,line)  
  end

  def split_line(line) do
    Regex.split(~r/<[~\*=-]*>/, line)
  end

  def remove_artifacts(line) do
    Regex.replace(~r/end-of-line[0-9]+/i,line,"")
  end

 def tag_with_user_name(line) do
    regex = ~r/User\s*(\S+)/
    case Regex.scan(regex, line) do
      [[_, name]] -> "[USER] #{name} #{line}"
      _ -> line
    end
  end
end
