defmodule Identicon do
  def main(input) do
    input
    |> hash_input
  end

  def hash_input(string) do
    hex =
      :crypto.hash(:md5, string)
      |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
