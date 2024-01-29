import
  types,
  std/[math, strformat]

export types

#### Vector access
template `[]`*[N: static int](this: Vector[N], idx: int): float =
  (array[N, float](this)[idx])
template `[]=`*[N: static int](this: Vector[N], idx: int, val: float) =
  (array[N, float](this)[idx] = val)
template len*(this: Vector): int = this.N

proc `$`*[N: static int](this: Vector[N]): string =
  var s = ""
  for i in 0..<N:
    s &= fmt"{this[i]}, "
  fmt"Vector{N}({s[0..^3]})"
proc `$`*(this: Vector2): string =
  fmt"Vector2(x: {this[0]}, y: {this[1]})"
proc `$`*(this: Vector3): string =
  fmt"Vector3(x: {this[0]}, y: {this[1]}, z: {this[2]})"
proc `$`*(this: Vector4): string =
  fmt"Vector3(x: {this[0]}, y: {this[1]}, z: {this[2]}, w: {this[3]})"

#### Vector constructors and members
proc Vec2*(x, y: float): Vector2 =
  Vector2([x, y])
proc Vec3*(x, y, z: float): Vector3 =
  Vector3([x, y, z])
proc Vec4*(x, y, z, w: float): Vector4 =
  Vector4([x, y, z, w])

template x*(this: VectorOrder[1]): float = this[0]
template `x=`*(this: var VectorOrder[1], val: float) = this[0] = val
template y*(this: VectorOrder[2]): float = this[1]
template `y=`*(this: var VectorOrder[2], val: float) = this[1] = val
template z*(this: VectorOrder[3]): float = this[2]
template `z=`*(this: var VectorOrder[3], val: float) = this[2] = val
template w*(this: VectorOrder[4]): float = this[3]
template `w=`*(this: var VectorOrder[4], val: float) = this[3] = val

#### Vector operations

proc `+`*[N: static int](a, b: Vector[N]): Vector[N] =
  ## Component addition of two vectors
  for i in 0..<N:
    result[i] = a[i] + b[i]

proc `-`*[N: static int](a, b: Vector[N]): Vector[N] =
  ## Component subtraction of two vectors
  for i in 0..<N:
    result[i] = a[i] - b[i]

proc `**`*[N: static int](a, b: Vector[N]): float =
  ## Dot product of two vectors
  for i in 0..<N:
    result += a[i] * b[i]

proc `*`*[N: static int](a, b: Vector[N]): Vector[N] =
  ## Component product of two vectors
  for i in 0..<N:
    result[i] = a[i] * b[i]

proc `*`*[N: static int](a: Vector[N], b: float): Vector[N] =
  ## Scalar product of a vector
  for i in 0..<N:
    result[i] = a[i] * b

template `*`*(a: float, b: Vector): Vector =
  ## Template for `*`
  `*`(b, a)

proc magnitude*[N: static int](this: Vector[N]): float =
  ## Magnitude operation
  for i in 0..<N:
    result += this[i] * this[i]
  result = sqrt(result)