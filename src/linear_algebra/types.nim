
type
  Vector*[N: static int] = distinct array[N, float]
  Vector4* = Vector[4]
  Vector3* = Vector[3]
  Vector2* = Vector[2]

  Matrix*[M, N: static int] = distinct array[M, array[N, float]]
  Mat4x4* = Matrix[4, 4]
  Mat3x3* = Matrix[3, 3]
  Mat2x2* = Matrix[2, 2]

  VectorOrder*[S: static int] = concept x
    x is Vector
    x.N >= S
