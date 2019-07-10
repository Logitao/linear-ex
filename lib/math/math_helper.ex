defmodule MathHelper do
  def to_radian(angle_deg) do
    angle_deg * :math.pi() / 180.0
  end

  def to_degree(angle_rad) do
    angle_rad * 180.0 / :math.pi()
  end

  def sin(angle) do
    angle
    |> to_radian
    |> :math.sin()
  end

  def cos(angle) do
    angle
    |> to_radian
    |> :math.cos()
  end

  def tan(angle) do
    angle
    |> to_radian
    |> :math.tan()
  end

  def get_angle2D(%Vector{x: x, y: y, z: 0}) do
    :math.atan(y |> div(x))
  end
end
