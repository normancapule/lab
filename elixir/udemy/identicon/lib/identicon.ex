defmodule Identicon do
  def main(input) do
    input
    |> hash_input
  end

  def hash_input(string) do
    :crypto.hash(:md5, string)
    |> :binary.bin_to_list
  end
end
