defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l), do: count(l, 0)
  def count([], counter), do: counter
  def count([_head | tail], counter), do: count(tail, counter + 1)

  @spec reverse(list) :: list
  def reverse(l), do: reverse(l, [])
  def reverse([], acc), do: acc
  def reverse([head | tail], acc), do: reverse(tail, [head] ++ acc)

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    l
    |> map(f, [])
    |> reverse
  end
  def map([], _f, acc), do: acc
  def map([ head | tail ], f, acc), do: map(tail, f, [f.(head)] ++ acc )

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    l
    |> filter(f, [])
    |> reverse
  end
  def filter([], _f, acc), do: acc
  def filter([head|tail], f, acc) do
    if f.(head) == true do
      filter(tail, f, [head] ++ acc)
    else
      filter(tail, f, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce(l, acc, f) do
    [ head | tail ] = l
    reduce(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    a ++ b
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    ll
    |> reverse
    |> concat([])
  end
  def concat([], acc), do: acc
  def concat([ head | tail ], acc) when is_list(head) do
    acc =
      head
      |> concat(acc)
    concat(tail, acc)
  end
  def concat(head, acc) do
    head ++ acc
  end
end
