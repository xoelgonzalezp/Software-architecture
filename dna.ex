defmodule DNA do
  def encode_nucleotide(?\s),do: 0b0000
  def encode_nucleotide(?A), do: 0b0001
  def encode_nucleotide(?C), do: 0b0010
  def encode_nucleotide(?G), do: 0b0100
  def encode_nucleotide(?T), do: 0b1000

  def decode_nucleotide(0b0000), do: ?\s
  def decode_nucleotide(0b0001), do: ?A
  def decode_nucleotide(0b0010), do: ?C
  def decode_nucleotide(0b0100), do: ?G
  def decode_nucleotide(0b1000), do: ?T 

  def encode(dna), do: do_encode(dna,'')
  defp do_encode([],bitstring), do: bitstring
  defp do_encode([head | tail ],''), do: do_encode(tail, <<encode_nucleotide(head)::4>>)
  defp do_encode([head | tail], bitstring), do: do_encode(tail, <<bitstring::bitstring, encode_nucleotide(head)::4>>)

  def decode(dna), do: do_decode(dna, [])
  defp do_decode(<<>>, result), do: reverse(result)
  defp do_decode(<<head::4, tail::bitstring>>, result), do: do_decode(tail, [decode_nucleotide(head) | result])

  defp reverse(list), do: do_reverse(list, [])
  defp do_reverse([], reversed), do: reversed
  defp do_reverse([head | tail], reversed), do: do_reverse(tail, [head | reversed])

end
