defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(& rna_character([&1]))
    |> Enum.concat
  end

  defp rna_character('G'), do: 'C'
  defp rna_character('C'), do: 'G'
  defp rna_character('T'), do: 'A'
  defp rna_character('A'), do: 'U'
end
