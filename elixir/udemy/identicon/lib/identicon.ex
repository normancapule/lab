defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex, colors: _colors} = _image) do
    hex
    |> Enum.chunk_every(3, 3, :discard)
    |> Enum.map(& mirror_row(&1))
  end

  def mirror_row([f, s | _tail] = row) do
    row ++ [s, f]
  end

  def pick_color(%Identicon.Image{hex: [r,g,b | _tail]} = image) do
    %Identicon.Image{ image | colors: { r, g, b }}
  end

  def hash_input(string) do
    hex =
      :crypto.hash(:md5, string)
      |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
