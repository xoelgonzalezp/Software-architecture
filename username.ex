defmodule Username do
  def sanitize([]), do: []
  def sanitize([hd | tl ]) do
    c = case hd do
          ?_ -> '_'
          ?ä -> 'ae'
          ?ö -> 'oe'
          ?ü -> 'ue'
          ?ß -> 'ss'
          character when character < ?a or character > ?z -> ''
           _ -> [hd]
          end
    c ++ sanitize(tl)      
  end
end