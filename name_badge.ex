defmodule NameBadge do
  def print(id, name, department) do
    prefix = if id == nil, do: "#{name}", else: "[#{id}] - #{name}"  
    suffix = if department == nil, do: "OWNER",else: String.upcase(department)
    "#{prefix} - #{suffix}"  
  end
end

