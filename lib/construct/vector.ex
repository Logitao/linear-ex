defmodule Vector do
  defstruct x: 0, y: 0, z: 0

  def times(%Vector{x: x, y: y, z: z}, num), do:
    %Vector{x: x * num, y: y * num, z: z * num}

  def add(%Vector{x: ax, y: ay, z: az}, %Vector{x: bx, y: by, z: bz}),
    do: %Vector{x: ax + bx, y: ay + by, z: az + bz}
  def add({%Vector{x: ax, y: ay, z: az}, %Vector{x: bx, y: by, z: bz}}),
    do: %Vector{x: ax + bx, y: ay + by, z: az + bz}

  def subtract(%Vector{x: ax, y: ay, z: az}, %Vector{x: bx, y: by, z: bz}),
    do: %Vector{x: ax - bx, y: ay - by, z: az - bz}
  def subtract({%Vector{x: ax, y: ay, z: az}, %Vector{x: bx, y: by, z: bz}}),
    do: %Vector{x: ax - bx, y: ay - by, z: az - bz}

  def dot_product(%Vector{x: ax, y: ay, z: az}, %Vector{x: bx, y: by, z: bz}),
    do: ax * bx + ay * by + az * bz
  def dot_product({%Vector{x: ax, y: ay, z: az}, %Vector{x: bx, y: by, z: bz}}),
    do: ax * bx + ay * by + az * bz

  def cross_product(%Vector{x: ax, y: ay, z: az}, %Vector{x: bx, y: by, z: bz}),
    do: %Vector{x: ay * bz - az * by, y: az * bx - ax * bz, z: ax * by - bx * ay}
  def cross_product({%Vector{x: ax, y: ay, z: az}, %Vector{x: bx, y: by, z: bz}}),
    do: %Vector{x: ay * bz - az * by, y: az * bx - ax * bz, z: ax * by - bx * ay}

  def length(%Vector{x: 0, y: 0, z: 0}),
    do: 0
  def length(%Vector{x: ax, y: ay, z: az}),
    do:
      (ax * ax + ay * ay + az + az) |> :math.sqrt()

  def from_angle(length, angle), do:
    %Vector{x: length * MathHelper.cos(angle), y: length * MathHelper.sin(angle), z: 0}

  def from_angle(%{length: length, angle: angle}), do:
    %Vector{x: length * MathHelper.cos(angle), y: length * MathHelper.sin(angle), z: 0}
end

