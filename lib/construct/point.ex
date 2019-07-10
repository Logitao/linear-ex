defmodule Point do
  defstruct x: 0, y: 0, z: 0

  def distance(%Point{x: ax, y: ay, z: az}, %Point{x: bx, y: by, z: bz}) do
    delta_x = (ax - bx) |> :math.pow(2)
    delta_y = (ay - by) |> :math.pow(2)
    delta_z = (az - bz) |> :math.pow(2)

    (delta_x + delta_y + delta_z) |> :math.sqrt()
  end
end
