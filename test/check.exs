defmodule ExCheck.SampleTest do
  use ExUnit.Case, async: false
  use ExCheck
  alias ExCheck.Sample

  property :square do
    for_all x in int, do: x * x >= 0
  end

  property :implies do
    for_all x in int do
      #implies skip samples that does not satisfy the predicate. Also, it prints x when skip a sample
      implies x >= 0 do
        x >= 0
      end
    end
  end

  property :such_that do
    for_all {x, y} in such_that({xx, yy} in {int, int} when xx < yy) do
      x < y
    end
  end

  property :concat_list do
    for_all {xs, ys} in {list(int), list(int)} do
      Enum.count(Sample.concat(xs, ys)) == Enum.count(xs) + Enum.count(ys)
    end
  end

  property :push_list do
    for_all {x, y} in {int, list(int)} do
      result = Sample.push(x, y)
      Enum.at(result, 0) == x and Enum.count(result) == Enum.count(y) + 1
    end
  end

  # specify iteration count for running test
  @tag iterations: 30
  property :square_with_iteration_count do
    for_all x in int, do: x * x >= 0
  end
end
