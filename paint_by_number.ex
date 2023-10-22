defmodule PaintByNumber do
  def palette_bit_size(color_count) when color_count <= 1, do: 1
  def palette_bit_size(color_count) when color_count >= 1 do
    palette_bit_size(color_count, 1)
  end
  defp palette_bit_size(color_count, bit) do 
    if :math.pow(2, bit) >= color_count do
      bit
    else
      palette_bit_size(color_count, bit + 1)
    end
  end

  def empty_picture() do
   <<>>
  end

  def test_picture() do
   <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bit = palette_bit_size(color_count)
    <<pixel_color_index::size(bit),picture::bitstring>>
  end

  def get_first_pixel(<<>>, _color_count) do
   nil
  end
  def get_first_pixel(picture, color_count) do
    bit = palette_bit_size(color_count)
    <<primero::size(bit), _::bitstring>> = picture
    primero
  end

  def drop_first_pixel(<<>>, _color_count) do
    <<>>
  end
  def drop_first_pixel(picture, color_count) do
    bit = palette_bit_size(color_count)
    <<_::size(bit), resto::bitstring>> = picture
    resto
  end

  def concat_pictures(picture1, picture2) do
     <<picture1::bitstring,picture2::bitstring>>
  end
end
