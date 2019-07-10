defmodule VectorTest do
  use ExUnit.Case
  doctest Vector

  test "initializes vector with correct structure" do
    %{x: x, y: y, z: z} = %Vector{x: 1, y: 2, z: 3}
    assert {x, y, z} == {1, 2, 3}
  end

  test "vector aditions are correct" do
    a = %Vector{x: 1, y: 2, z: 3}
    b = %Vector{x: 1, y: 2, z: 3}

    c = {a, b} |> Vector.add()
    assert c == %Vector{x: 2, y: 4, z: 6}
  end

  test "vector subtractions are correct" do
    a = %Vector{x: 1, y: 2, z: 3}
    b = %Vector{x: 1, y: 2, z: 3}

    c = {a, b} |> Vector.subtract()
    assert c == %Vector{}
  end

  test "vector scalar multiplications are correct" do
    a = %Vector{x: 1, y: 2, z: 3}
    b = %Vector{x: 7, y: 7, z: 2}

    c = a |> Vector.times(3)
    assert c == %Vector{x: 3, y: 6, z: 9}

    c = b |> Vector.times(2)
    assert c == %Vector{x: 14, y: 14, z: 4}
  end

  test "combining operations" do
    a = %Vector{x: 1, y: 2, z: 3}
    b = %Vector{x: 1, y: 2, z: 3}

    c = %Vector{x: 7, y: 7, z: 2}
    d = %Vector{x: 9, y: 1, z: 2}

    result =
      {a, b}
      |> Vector.add()
      |> Vector.subtract(c)
      |> Vector.times(2)

    assert result == %Vector{x: -10, y: -6, z: 8}
  end

  test "vector length" do

    a = %Vector{x: 7, y: 7, z: 2}
    b = %Vector{x: 3, y: 3, z: 3}

    %Vector{x: ax, y: ay, z: az} = a
    result = a |> Vector.length()

    assert ax * ax + ay * ay + az * az - result * result <= 1.19e-7
  end

  test "dot product" do
    a = %Vector{x: 7, y: 7, z: 2}
    b = %Vector{x: 3, y: 3, z: 3}

    result = {a, b} |> Vector.dot_product()

    assert result == 48
  end
end
